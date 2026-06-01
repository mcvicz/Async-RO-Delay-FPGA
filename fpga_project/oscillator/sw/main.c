//=============================================================================
// main.c -- bare-metal ARM (Zynq PS) odczyt freq_counter przez AXI-Lite
//
// Kopiuj do projektu aplikacji w Xilinx SDK (2018.3) po Export Hardware.
// Wymaga: BSP z UART (stdout na PS UART1) + driver xadcps (PS XADC, temp).
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
#include "xadcps.h"     // PS XADC -- temperatura krzemu (F8: f(T))

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

//=============================================================================
// PS XADC -- temperatura krzemu (do EXP_04 f(T))
//=============================================================================
static XAdcPs xadc;

int xadc_init(void)
{
    XAdcPs_Config *cfg = XAdcPs_LookupConfig(XPAR_XADCPS_0_DEVICE_ID);
    if (cfg == NULL) return XST_FAILURE;
    if (XAdcPs_CfgInitialize(&xadc, cfg, cfg->BaseAddress) != XST_SUCCESS)
        return XST_FAILURE;
    XAdcPs_SetSequencerMode(&xadc, XADCPS_SEQ_MODE_SAFE);
    return XST_SUCCESS;
}

// Temperatura *10 (jako int -- unikamy printf float w standalone).
// np. 423 = 42.3 C
int xadc_temp_x10(void)
{
    u32 raw = XAdcPs_GetAdcData(&xadc, XADCPS_CH_TEMP);
    float t = XAdcPs_RawToTemperature(raw);
    return (int)(t * 10.0f);
}

int main()
{
    const char *names[4] = { "sync", "carry", "loopback", "lut" };

    printf("\r\n=== Async Ring Oscillator -- pomiar f ===\r\n");

    // Init XADC (temperatura krzemu). Jak brak -> temp = 0.
    int have_xadc = (xadc_init() == XST_SUCCESS);
    if (!have_xadc) printf("# WARN: XADC init fail, temp_c = 0\r\n");

    // Kanoniczna schema CSV (zgodna z analysis/*.py):
    //   sample,timestamp_ms,variant,tap,edges,freq_khz,temp_c
    printf("sample,timestamp_ms,variant,tap,edges,freq_khz,temp_c\r\n");

    int sample = 0;
    u32 t_ms = 0;

    // makro: realna temp (x10 -> int.dec) lub 0
    #define TEMP10 (have_xadc ? xadc_temp_x10() : 0)
    #define PT(t) (t)/10, (t)<0 ? -((t)%10) : (t)%10   // znak + ulamek

    // Sweep f(N): wariant CARRY4, rozne tap
    for (u8 tap = 4; tap <= 63; tap += 4) {
        u32 edges = measure(1 /*carry*/, tap);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;   // edges*256 per 1ms = kHz
        int t = TEMP10;
        printf("%d,%u,%s,%u,%u,%u,%d.%d\r\n",
               sample++, t_ms, names[1], tap, edges, freq_khz, PT(t));
        t_ms += 100; usleep(100000);
    }

    // Porownanie wariantow przy tap=63
    for (u8 v = 0; v < 4; v++) {
        u32 edges = measure(v, 63);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;
        int t = TEMP10;
        printf("%d,%u,%s,63,%u,%u,%d.%d\r\n",
               sample++, t_ms, names[v], edges, freq_khz, PT(t));
        t_ms += 100; usleep(100000);
    }

    // Ciagly monitoring CARRY4 tap=32 (do jittera/drift/f(T) -- grzej chip)
    printf("\r\n--- monitoring CARRY4 tap=32 (Ctrl+C aby przerwac) ---\r\n");
    while (1) {
        u32 edges = measure(1, 32);
        u32 freq_khz = edges * PRESCALER / WINDOW_MS;
        int t = TEMP10;
        printf("%d,%u,carry,32,%u,%u,%d.%d\r\n",
               sample++, t_ms, edges, freq_khz, PT(t));
        t_ms += 500; usleep(500000);
    }

    return 0;
}
