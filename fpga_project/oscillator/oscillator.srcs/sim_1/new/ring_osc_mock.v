`timescale 1ns / 1ps
//=============================================================================
// RING_OSC_MOCK -- sim-only behavioral model ring oscillatora
//
// NIE SYNTEZOWALNY. Modeluje zachowanie ringu z jawnym #delay.
// Omija fundamental limitation XSim z combinational loops:
// zamiast prawdziwej petli kombinacyjnej -> forever loop z explicit toggle.
//
// Parametr PERIOD definiuje czestotliwosc oscylacji:
//   PERIOD = 2.0 ns  -> f = 500 MHz (typowy CARRY4 ring 64 stages)
//   PERIOD = 0.7 ns  -> f = ~1.4 GHz (LUT ring 15 stages)
//   PERIOD = 10.0 ns -> f = 100 MHz (IO loopback z PCB delay)
//
// Tap_select skala PERIOD liniowo (krotsza petla = wyzsza f):
//   tap = 64 -> period = PERIOD
//   tap = 32 -> period = PERIOD/2 (2x szybciej)
//   tap = 16 -> period = PERIOD/4
//=============================================================================

module ring_osc_mock #(
    parameter real PERIOD_BASE = 2.0    // ns, dla tap=64
)(
    input  wire        enable,
    input  wire [5:0]  tap_select,
    output reg         osc_out
);

    real effective_period;

    // Skalowanie okresu zaleznie od tap_select
    always @(*) begin
        if (tap_select == 0)
            effective_period = PERIOD_BASE / 64.0;
        else
            effective_period = PERIOD_BASE * (tap_select + 1) / 64.0;
    end

    initial begin
        osc_out = 0;
        forever begin
            #(effective_period / 2.0);
            if (enable) osc_out = ~osc_out;
            else        osc_out = 0;
        end
    end

endmodule
