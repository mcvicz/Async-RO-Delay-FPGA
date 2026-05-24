`timescale 1ns / 1ps
//=============================================================================
// TB_ASYNC_RO_LUT -- testbench dla LUT ring oscillator (15 inwerterow)
//
// Tak samo jak tb_async_ro_carry -- wymaga POST-IMPLEMENTATION TIMING SIM
// z plikiem SDF aby zobaczyc oscylacje. Behavioral sim pokaze 0 delay loop.
//=============================================================================

module tb_async_ro_lut;

    reg  enable;
    wire osc_out;

    async_ro_lut #(.N_INVERTERS(15)) dut (
        .enable  (enable),
        .osc_out (osc_out)
    );

    initial begin
        enable = 1'b0;

        #10;
        enable = 1'b1;     // start oscylacji
        #100;              // pozwol pooscylowac

        enable = 1'b0;     // stop
        #20;

        enable = 1'b1;
        #50;

        $finish;
    end

    initial begin
        $dumpfile("tb_async_ro_lut.vcd");
        $dumpvars(0, tb_async_ro_lut);
    end

endmodule
