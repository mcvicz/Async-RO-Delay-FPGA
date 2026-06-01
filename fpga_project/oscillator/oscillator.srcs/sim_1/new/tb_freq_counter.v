`timescale 1ns / 1ps
//=============================================================================
// TB_FREQ_COUNTER -- testbench demonstrujacy pomiar czestotliwosci
//
// Laczy ring_osc_mock (oscylator o znanej f) z freq_counter i sprawdza
// czy licznik zlicza prawidlowa liczbe zboczy w oknie czasowym.
//
// Konfiguracja sym:
//  - clk 100 MHz (period 10 ns)
//  - mock osc PERIOD_BASE=40ns przy tap=63 -> f = 25 MHz
//  - WINDOW_CYCLES=1000 (krotkie okno = 10 us @ 100 MHz, szybka sym)
//
// Oczekiwany wynik:
//  25 MHz * 10 us = 250 zboczy w oknie -> freq_count ~= 250
//  (moze byc +/-1 przez fazowanie synchronizera)
//
// Drugi test: zmiana tap -> wyzsza f -> wiecej zboczy.
//=============================================================================

module tb_freq_counter;

    reg         clk;
    reg         rst_n;
    reg  [5:0]  tap_select;
    wire        osc;
    wire [31:0] freq_count;
    wire        valid;

    // Mock oscylator -- PERIOD_BASE=40ns -> 25 MHz przy tap=63
    ring_osc_mock #(.PERIOD_BASE(40.0)) dut_osc (
        .enable     (1'b1),
        .tap_select (tap_select),
        .osc_out    (osc)
    );

    // Licznik czestotliwosci -- krotkie okno dla szybkiej sym
    freq_counter #(.WINDOW_CYCLES(1000)) dut_fc (
        .clk        (clk),
        .rst_n      (rst_n),
        .osc_in     (osc),
        .freq_count (freq_count),
        .valid      (valid)
    );

    // Zegar 100 MHz
    initial clk = 0;
    always #5 clk = ~clk;

    // Monitor -- print wynik gdy valid
    always @(posedge clk) begin
        if (valid)
            $display("[%0t ns] POMIAR: freq_count = %0d zboczy (tap=%0d)",
                     $time, freq_count, tap_select);
    end

    initial begin
        rst_n      = 0;
        tap_select = 6'd63;   // f = 25 MHz
        #20;
        rst_n = 1;

        // Pierwsze okno: 25 MHz -> ~250 zboczy
        #12000;   // 12 us -> przejdzie 1 pelne okno (10us)

        // Zmien tap -> krotsza petla -> wyzsza f -> wiecej zboczy
        tap_select = 6'd31;   // f ~= 50 MHz -> ~500 zboczy
        #12000;

        tap_select = 6'd15;   // f ~= 100 MHz (Nyquist limit! aliasing moze byc)
        #12000;

        $display("Test freq_counter zakonczony");
        $finish;
    end

endmodule
