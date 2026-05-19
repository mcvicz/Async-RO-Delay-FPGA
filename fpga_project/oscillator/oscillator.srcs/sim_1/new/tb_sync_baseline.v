`timescale 1ns / 1ps

module tb_sync_baseline;

    reg clk;
    reg rst_n;
    reg enable;
    wire osc_out;
    
    sync_baseline #(.WIDTH(8)) dut (
        .clk (clk),
        .rst_n (rst_n),
        .enable (enable),
        .osc_out (osc_out)
    );
    
// Zegar 100 MHz (okres 10 ns)
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst_n = 0;
        enable = 0;
        #100;
        rst_n = 1;
        #50;
        enable = 1;
        #10000; // 10 us simulation
        $finish;
    end
    
endmodule