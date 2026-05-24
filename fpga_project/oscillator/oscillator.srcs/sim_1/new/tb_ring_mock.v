`timescale 1ns / 1ps
//=============================================================================
// TB_RING_MOCK -- testbench dla ring_osc_mock
//
// Pokazuje:
//  - oscylacja ring oscillatora po enable=1
//  - stop oscylacji po enable=0
//  - zmiana czestotliwosci w zaleznosci od tap_select (krotsza petla = wyzsza f)
//
// Sym BEHAVIORAL (NIE post-impl) -> dziala zawsze, brak issue z comb loop.
//=============================================================================

module tb_ring_mock;

    reg        enable;
    reg  [5:0] tap_select;
    wire       osc_carry;
    wire       osc_lut;

    // 2 instancje mock -- CARRY4 ring (slow) i LUT ring (fast)
    ring_osc_mock #(.PERIOD_BASE(3.2)) dut_carry (
        .enable     (enable),
        .tap_select (tap_select),
        .osc_out    (osc_carry)
    );

    ring_osc_mock #(.PERIOD_BASE(0.7)) dut_lut (
        .enable     (enable),
        .tap_select (tap_select),
        .osc_out    (osc_lut)
    );

    initial begin
        // Faza 1: enable=0, oba oscy = 0
        enable     = 1'b0;
        tap_select = 6'd63;   // pelny tap = nominal period
        #5;

        // Faza 2: enable=1, oscylacja z PERIOD_BASE
        enable = 1'b1;
        #30;   // 30 ns -- kilka cykli widocznych

        // Faza 3: krotszy tap -> wyzsza f
        tap_select = 6'd15;   // ~1/4 nominal period
        #20;

        // Faza 4: jeszcze krotszy tap
        tap_select = 6'd3;    // ~1/16 nominal period
        #15;

        // Faza 5: stop
        enable = 1'b0;
        #5;

        // Faza 6: restart z innym tap
        enable     = 1'b1;
        tap_select = 6'd31;
        #20;

        $display("Test ring_osc_mock zakonczony pomyslnie");
        $finish;
    end

endmodule
