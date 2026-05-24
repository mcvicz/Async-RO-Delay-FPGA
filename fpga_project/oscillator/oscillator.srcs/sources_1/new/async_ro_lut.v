`timescale 1ns / 1ps
//=============================================================================
// ASYNC_RO_LUT -- ring oscillator z lancucha LUT1 (15 inwerterow)
//
// Klasyczny ring oscillator: nieparzysta liczba inwerterow w petli.
// 15 stopni LUT1 (INIT=2'b01 = NOT) ulozonych szeregowo.
// Sugestia Jamro -- prostsze niz CARRY4, ale "z LUT" wbrew oryginalnej tezie.
// Sluzy jako 4-ty wariant porownawczy w tabeli sync vs async.
//
// Wlasciwosci spodziewane:
//  - f_osc ~ kilkaset MHz (15 stopni LUT-delay + routing)
//  - jitter wiekszy niz CARRY4 (routing miedzy LUT-ami "luzny")
//  - mniej powtarzalne miedzy syntezami bez LOC
//=============================================================================

module async_ro_lut #(
    parameter N_INVERTERS = 15  // musi byc NIEPARZYSTA dla oscylacji
)(
    input  wire enable,
    output wire osc_out
);

    (* dont_touch = "true", keep = "true" *) wire [N_INVERTERS:0] chain;
    (* dont_touch = "true", keep = "true" *) wire ring_feedback;
    (* dont_touch = "true", keep = "true" *) wire loop_in;

    // Enable gate -- rozrywa petle gdy enable=0
    assign loop_in = enable & ring_feedback;

    // Start lancucha
    assign chain[0] = loop_in;

    //--- Lancuch 15 inwerterow LUT1 ---
    genvar i;
    generate
        for (i = 0; i < N_INVERTERS; i = i + 1) begin : gen_inv
            (* dont_touch = "true", keep = "true" *)
            LUT1 #(.INIT(2'b01)) inv_stage (
                .I0 (chain[i]),
                .O  (chain[i+1])
            );
        end
    endgenerate

    // Zamkniecie petli -- ostatni LUT laczy sie z poczatkiem
    assign ring_feedback = chain[N_INVERTERS];

    //--- Wyjscie ---
    assign osc_out = enable ? chain[N_INVERTERS] : 1'b0;

endmodule
