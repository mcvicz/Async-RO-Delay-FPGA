`timescale 1ns / 1ps
// TODO: frequency counter z oknem 1ms
module freq_counter (
    input wire clk,
    input wire rst_n,
    input wire osc_in,
    output wire [31:0] freq_count,
    output wire valid
);
    // placeholder - 4 
    assign freq_count = 32'd0;
    assign valid = 1'b0;
endmodule