//=============================================================================
// main.c -- bare-metal ARM (Zynq PS) odczyt freq_counter przez AXI-Lite
//
// Kopiuj do projektu aplikacji w Vitis (po Export Hardware + Launch Vitis).
// Wymaga: platform BSP z UART (domyslny stdout na PS UART1 ZedBoard).
//
// MAPA REJESTROW (offset od bazy AXI, sprawdz w Address Editor / xparameters.h):
//   0x00 freq_count [31:0]  RO -- zbocza w oknie 1ms (po prescalerze /256)
//   0x04 control            RW -- [1:0]=osc_select, [2]=enable
//   0x08 status             RO -- [0]=valid
//   0x0C tap_select [5:0]   RW
//
// Realna f = freq_count * 256 / 0.001s = freq_count * 256 kHz
//=============================================================================

#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"

// Baza AXI -- z xparameters.h: XPAR_OSC_AXI_SYSTEM_0_BASEADDR = 0x43C00000
#ifdef XPAR_OSC_AXI_SYSTEM_0_BASEADDR
  #define OSC_BASE  XPAR_OSC_AXI_SYSTEM_0_BASEADDR
#else
  #define OSC_BASE  0x43C00000
#endif

#define REG_FREQ    0x00
#define REG_CTRL    0x04
#define REG_STATUS  0x08
#define REG_TAP     0x0C

#define PRESCALER   256       // DIV_BITS=8
#define WINDOW_MS   1         // okno 1 ms

// control bity
#define CTRL_ENABLE  (1u << 2)

static inline void  osc_write(u32 off, u32 v) { Xil_Out32(OSC_BASE + off, v); }
static inline u32   osc_read (u32 off)        { return Xil_In32(OSC_BASE + off); }

// Zmierz czestotliwosc wybranego wariantu przy danym tap
u32 measure(u8 variant, u8 tap)
{
    osc_write(REG_TAP, tap & 0x3F);
    osc_write(REG_CTRL, CTRL_ENABLE | (variant & 0x3));

    // czekaj na nowy pomiar (valid)
    int timeout = 1000000;
    while (!(osc_read(REG_STATUS) & 0x1) && timeout--) { }
    (void)osc_read(REG_STATUS);   // odczyt kasuje valid

    return osc_read(REG_FREQ);
}

int main()
{
    const char *names[4] = { "sync", "carry", "loopback", "lut" };

    printf("\r\n=== Async Ring Oscillator -- pomiar f ===\r\n");
    printf("sample,variant,tap,edges,freq_kHz\r\n");

    int sample = 0;

    // Sweep f(N): wariant CARRY4, rozne tap
    for (u8 tap = 4; tap <= 63; tap += 4) {
        u32 edges = measure(1 /*carry*/, tap);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;   // edges*256 per 1ms = kHz
        printf("%d,%s,%u,%u,%u\r\n", sample++, names[1], tap, edges, freq_khz);
        usleep(100000);
    }

    // Porownanie wariantow przy tap=63
    for (u8 v = 0; v < 4; v++) {
        u32 edges = measure(v, 63);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;
        printf("%d,%s,63,%u,%u\r\n", sample++, names[v], edges, freq_khz);
        usleep(100000);
    }

    // Ciagly monitoring wybranego wariantu (do jittera/drift)
    printf("\r\n--- monitoring CARRY4 tap=32 (Ctrl+C aby przerwac) ---\r\n");
    while (1) {
        u32 edges = measure(1, 32);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;
        printf("%d,carry,32,%u,%u\r\n", sample++, edges, freq_khz);
        usleep(500000);
    }

    return 0;
}
