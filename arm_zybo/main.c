//=============================================================================
// main.c -- bare-metal ARM (Zynq PS7 Cortex-A9) odczyt freq_counter przez AXI
//           Zybo Z7-10. Wypisuje CSV na UART1 (PuTTY 115200 8N1).
//
// Aplikacja bare-metal dla Xilinx SDK 2018.3 (app 'osc_freq_read', src/helloworld.c).
// Odczyt XADC pominiety (niewymagany dla tego toru pomiarowego).
//
// MAPA REJESTROW (offset od bazy AXI = 0x43C00000):
//   0x00 freq_count [31:0]  RO -- zbocza w oknie 1 ms (po prescalerze /256)
//   0x04 control            RW -- [1:0]=osc_select, [2]=enable
//   0x08 status             RO -- [0]=valid
//   0x0C tap_select [5:0]   RW
//
// Realna f = freq_count * 256 / 1ms = freq_count * 256 kHz
// Warianty osc_select: 0=sync 1=carry 2=loopback 3=lut
//=============================================================================

#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"

// Baza AXI -- z xparameters.h. Rozne nazwy zaleznie od wersji generatora.
#if   defined(XPAR_OSC_AXI_SYSTEM_0_S00_AXI_BASEADDR)
  #define OSC_BASE  XPAR_OSC_AXI_SYSTEM_0_S00_AXI_BASEADDR
#elif defined(XPAR_OSC_AXI_SYSTEM_0_BASEADDR)
  #define OSC_BASE  XPAR_OSC_AXI_SYSTEM_0_BASEADDR
#else
  #define OSC_BASE  0x43C00000
#endif

#define REG_FREQ    0x00
#define REG_CTRL    0x04
#define REG_STATUS  0x08
#define REG_TAP     0x0C

#define PRESCALER   256       // DIV_BITS=8 w osc_axi_system
#define WINDOW_MS   1         // okno 1 ms (FCLK0=100MHz, 100_000 cykli)
#define CTRL_ENABLE (1u << 2)

static inline void osc_write(u32 off, u32 v) { Xil_Out32(OSC_BASE + off, v); }
static inline u32  osc_read (u32 off)        { return Xil_In32(OSC_BASE + off); }

// Zmierz czestotliwosc wybranego wariantu przy danym tap.
// Zwraca surowe freq_count (zbocza w oknie). f_khz = freq_count * 256.
static u32 measure(u8 variant, u8 tap)
{
    osc_write(REG_TAP,  tap & 0x3F);
    osc_write(REG_CTRL, CTRL_ENABLE | (variant & 0x3));

    // Okno freq_counter jest free-running: pierwsze window_done po zmianie
    // osc_select/tap "przekracza" przelaczenie (liczy stary+nowy oscylator).
    // Dlatego ODRZUC pierwsze okno, zwroc drugie (zmierzone cale pod nowa
    // konfiguracja). Koszt: ~1-2 ms extra na sample, pomijalny.
    u32 freq = 0;
    for (int i = 0; i < 2; i++) {
        osc_read(REG_STATUS);                       // skasuj sticky valid
        int timeout = 2000000;
        while (!(osc_read(REG_STATUS) & 0x1) && --timeout) { }
        osc_read(REG_STATUS);                        // odczyt kasuje valid
        freq = osc_read(REG_FREQ);                   // i=0 straddle (odrzut), i=1 czyste
    }
    return freq;
}

int main(void)
{
    const char *names[4] = { "sync", "carry", "loopback", "lut" };

    printf("\r\n=== Async Ring Oscillator -- ARM/AXI na Zybo Z7-10 ===\r\n");
    printf("base=0x%08X  prescaler=%d  window=%dms\r\n", OSC_BASE, PRESCALER, WINDOW_MS);
    printf("sample,variant,tap,edges,freq_khz\r\n");

    int sample = 0;

    // 1) Sweep f(N): wariant CARRY4, tap 4..63 co 4
    for (u8 tap = 4; tap <= 63; tap += 4) {
        u32 edges = measure(1 /*carry*/, tap);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;
        printf("%d,%s,%u,%u,%u\r\n", sample++, names[1], tap, edges, freq_khz);
        usleep(100000);
    }

    // 2) Porownanie wariantow przy tap=63
    for (u8 v = 0; v < 4; v++) {
        u32 edges = measure(v, 63);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;
        printf("%d,%s,63,%u,%u\r\n", sample++, names[v], edges, freq_khz);
        usleep(100000);
    }

    // 3) Ciagly monitoring CARRY4 tap=32 (jitter/drift)
    printf("\r\n--- monitoring CARRY4 tap=32 ---\r\n");
    while (1) {
        u32 edges = measure(1, 32);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;
        printf("%d,carry,32,%u,%u\r\n", sample++, edges, freq_khz);
        usleep(500000);
    }

    return 0;
}
