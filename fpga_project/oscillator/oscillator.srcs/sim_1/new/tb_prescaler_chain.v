`timescale 1ns / 1ps
//=============================================================================
// TB_PRESCALER_CHAIN -- pelny tor pomiaru wysokiej czestotliwosci
//
// Lancuch: mock ring (320 MHz) -> async_prescaler /16 -> freq_counter
//
// Pokazuje ze prescaler pozwala zmierzyc f POWYZEJ limitu Nyquista
// licznika 100 MHz.
//
// Konfiguracja:
//   mock osc PERIOD_BASE=3.125ns przy tap=63 -> f = 320 MHz
//   prescaler DIV_BITS=4 -> /16 -> 320/16 = 20 MHz (mierzalne, <50 MHz)
//   freq_counter WINDOW=1000 cykli = 10 us
//
// Oczekiwany wynik:
//   20 MHz * 10 us = 200 zbocz -> freq_count ~= 200
//   realna f = freq_count * 16 / 10 [MHz] = 200*16/10 = 320 MHz  <-- ODZYSK!
//
// Drugi tap: tap=31 -> 640 MHz -> /16 -> 40 MHz -> ~400 zbocz -> 640 MHz
//=============================================================================

module tb_prescaler_chain;

    localparam DIV = 16;   // 2^DIV_BITS, DIV_BITS=4

    reg         clk;
    reg         rst_n;
    reg  [5:0]  tap_select;
    wire        osc_fast;
    wire        osc_div;
    wire [31:0] freq_count;
    wire        valid;

    // Mock ring: tap=63 -> 320 MHz
    ring_osc_mock #(.PERIOD_BASE(3.125)) dut_osc (
        .enable     (1'b1),
        .tap_select (tap_select),
        .osc_out    (osc_fast)
    );

    // Prescaler /16
    async_prescaler #(.DIV_BITS(4)) dut_presc (
        .osc_in  (osc_fast),
        .rst_n   (rst_n),
        .osc_div (osc_div)
    );

    // Licznik czestotliwosci, okno 10 us
    freq_counter #(.WINDOW_CYCLES(1000)) dut_fc (
        .clk        (clk),
        .rst_n      (rst_n),
        .osc_in     (osc_div),
        .freq_count (freq_count),
        .valid      (valid)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    // Monitor -- odzysk realnej f
    always @(posedge clk) begin
        if (valid)
            $display("[%0t] freq_count=%0d zbocz (po /%0d) -> REALNA f = %0d MHz (tap=%0d)",
                     $time, freq_count, DIV, freq_count * DIV / 10, tap_select);
    end

    initial begin
        rst_n      = 0;
        tap_select = 6'd63;   // 320 MHz
        #20;
        rst_n = 1;

        #12000;   // okno 10us: 320MHz/16=20MHz -> ~200 zbocz -> odzysk 320 MHz

        tap_select = 6'd31;   // 640 MHz -> /16 = 40 MHz -> ~400 zbocz -> 640 MHz
        #12000;

        $display("Test prescaler_chain zakonczony");
        $finish;
    end

endmodule
