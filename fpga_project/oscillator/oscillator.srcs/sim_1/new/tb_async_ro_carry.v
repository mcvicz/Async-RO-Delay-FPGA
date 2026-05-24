`timescale 1ns / 1ps
//=============================================================================
// TB_ASYNC_RO_CARRY -- testbench dla CARRY4 ring oscillator
//
// UWAGA: behavioral sim NIE pokaze oscylacji.
// Wymaga POST-IMPLEMENTATION TIMING SIMULATION z SDF.
//
// Skrocony: tap_select = 5 (krotka petla, 5 CARRY4 stages w mux path)
// zeby symulator nie dlawil sie na 64 stage chain. Po pierwszej dzialajacej
// sym mozna zwiekszyc tap_select.
//=============================================================================

module tb_async_ro_carry;

    reg        enable;
    reg  [5:0] tap_select;
    wire       osc_out;

    async_ro_carry dut (
        .enable     (enable),
        .tap_select (tap_select),
        .osc_out    (osc_out)
    );

    initial begin
        // Start: enable=0, krotki tap dla szybszej sym
        enable     = 1'b0;
        tap_select = 6'd5;   // tylko 5 CARRY4 stages w petli -> szybciej sym

        // Krotki initial delay
        #2;
        enable = 1'b1;       // start oscylacji

        // Pozwol pooscylowac
        #30;

        // Zmien tap (jeszcze krotsza petla)
        tap_select = 6'd2;
        #20;

        // Stop
        enable = 1'b0;
        #5;

        // Restart
        enable = 1'b1;
        tap_select = 6'd3;
        #15;

        $finish;
    end

endmodule
