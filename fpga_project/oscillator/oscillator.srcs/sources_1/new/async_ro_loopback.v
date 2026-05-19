`timescale 1ns / 1ps

// TODO: implementacja ring oscillatora przez Pmod
module async_ro_loopback (
    input wire enable,
    input wire pmod_in,
    output wire pmod_out,
    output wire osc_out
);
    // placeholder - 6
    assign pmod_out = 1'b0;
    assign osc_out = pmod_in;
endmodule