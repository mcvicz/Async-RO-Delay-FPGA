`timescale 1ns / 1ps
//=============================================================================
// ASYNC_RO_CARRY v2 -- ring oscillator z lancucha CARRY4
//
// N=64 blokow CARRY4 ulozonych pionowo (LOC w XDC -- OBOWIAZKOWE!).
// Kazdy CARRY4 ma dedykowane fast carry routing do nastepnego CARRY4
// w sasiednim SLICE (X stale, Y+1). Bez LOC -> DRC DXSTAT-3 error.
//
// dont_touch + keep tylko na wezlach loop closure (ring_feedback, loop_in,
// selected_tap, loop_inverter) -- NIE na wezlach cascade, zeby pozwolic
// optymalizatorowi uzyc dedykowanego carry routing.
//=============================================================================

module async_ro_carry #(
    parameter N_STAGES = 64
)(
    input  wire enable,
    input  wire [5:0] tap_select,
    output wire osc_out
);

    wire [N_STAGES-1:0] tap_bus;
    (* dont_touch = "true", keep = "true" *) wire ring_feedback;
    (* dont_touch = "true", keep = "true" *) wire selected_tap;
    (* dont_touch = "true", keep = "true" *) wire loop_in;

    // Bramkowanie enable -- otwiera petle gdy enable=0
    assign loop_in = enable & ring_feedback;

    //--- Lancuch CARRY4 (BEZ dont_touch na cascade wires!) ---
    genvar i;
    generate
        for (i = 0; i < N_STAGES; i = i + 1) begin : gen_carry
            wire [3:0] co_local;

            (* keep = "true" *)
            CARRY4 carry_stage (
                .CO     (co_local),
                .O      (),
                .CI     ((i == 0) ? 1'b0    : tap_bus[i-1]),
                .CYINIT ((i == 0) ? loop_in : 1'b0),
                .DI     (4'b0000),
                .S      (4'b1111)
            );

            assign tap_bus[i] = co_local[3];
        end
    endgenerate

    //--- Tap multiplexer ---
    assign selected_tap = tap_bus[tap_select];

    //--- Loop closure: LUT1 jako NOT ---
    (* dont_touch = "true", keep = "true" *)
    LUT1 #(.INIT(2'b01)) loop_inverter (
        .I0 (selected_tap),
        .O  (ring_feedback)
    );

    //--- Wyjscie ---
    assign osc_out = enable ? selected_tap : 1'b0;

endmodule
