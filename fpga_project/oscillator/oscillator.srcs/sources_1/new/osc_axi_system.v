`timescale 1ns / 1ps
//=============================================================================
// OSC_AXI_SYSTEM -- PL top dla Block Design (Zynq PS + ten modul)
//
// Zawiera: 4 warianty oscylatorow + mux + prescaler /256 + freq_counter_axi.
// PS (ARM) przez AXI-Lite:
//   - czyta freq_count (REG0)
//   - ustawia osc_select (REG1) -> wybor wariantu
//   - ustawia tap_select (REG3) -> dlugosc petli CARRY4
//
// Wyjscia fizyczne: pmod (loopback), led_osc (podglad).
// Interfejs AXI s00_axi_* -> auto-rozpoznany w BD.
//=============================================================================

module osc_axi_system #(
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 4
)(
    // Fizyczne PL
    input  wire        pmod_in,
    output wire        pmod_out,
    output wire        led_osc,

    // AXI4-Lite
    input  wire                              s00_axi_aclk,
    input  wire                              s00_axi_aresetn,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]     s00_axi_awaddr,
    input  wire [2:0]                        s00_axi_awprot,
    input  wire                              s00_axi_awvalid,
    output wire                              s00_axi_awready,
    input  wire [C_S_AXI_DATA_WIDTH-1:0]     s00_axi_wdata,
    input  wire [(C_S_AXI_DATA_WIDTH/8)-1:0] s00_axi_wstrb,
    input  wire                              s00_axi_wvalid,
    output wire                              s00_axi_wready,
    output wire [1:0]                        s00_axi_bresp,
    output wire                              s00_axi_bvalid,
    input  wire                              s00_axi_bready,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]     s00_axi_araddr,
    input  wire [2:0]                        s00_axi_arprot,
    input  wire                              s00_axi_arvalid,
    output wire                              s00_axi_arready,
    output wire [C_S_AXI_DATA_WIDTH-1:0]     s00_axi_rdata,
    output wire [1:0]                        s00_axi_rresp,
    output wire                              s00_axi_rvalid,
    input  wire                              s00_axi_rready
);

    wire        rst_n = s00_axi_aresetn;
    wire [1:0]  osc_select;
    wire        osc_enable;
    wire [5:0]  tap_select;

    //--- 4 warianty ---
    wire osc_sync, osc_carry, osc_loopback, osc_lut;

    sync_baseline #(.WIDTH(24)) inst_sync (
        .clk(s00_axi_aclk), .rst_n(rst_n), .enable(1'b1), .osc_out(osc_sync)
    );
    async_ro_carry inst_carry (
        .enable(osc_enable), .tap_select(tap_select), .osc_out(osc_carry)
    );
    async_ro_loopback inst_loopback (
        .enable(osc_enable), .pmod_in(pmod_in), .pmod_out(pmod_out), .osc_out(osc_loopback)
    );
    async_ro_lut #(.N_INVERTERS(15)) inst_lut (
        .enable(osc_enable), .osc_out(osc_lut)
    );

    //--- Mux wariantu (sterowany z AXI REG1) ---
    reg osc_selected;
    always @(*) begin
        case (osc_select)
            2'b00:   osc_selected = osc_sync;
            2'b01:   osc_selected = osc_carry;
            2'b10:   osc_selected = osc_loopback;
            2'b11:   osc_selected = osc_lut;
            default: osc_selected = 1'b0;
        endcase
    end

    //--- Prescaler /256 (umozliwia pomiar szybkiego ringu) ---
    wire osc_div;
    async_prescaler #(.DIV_BITS(8)) inst_presc (
        .osc_in(osc_selected), .rst_n(rst_n), .osc_div(osc_div)
    );

    //--- AXI slave + freq_counter ---
    freq_counter_axi #(
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
    ) inst_axi (
        .osc_in     (osc_div),
        .osc_select (osc_select),
        .osc_enable (osc_enable),
        .tap_select (tap_select),
        .s00_axi_aclk(s00_axi_aclk), .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_awaddr(s00_axi_awaddr), .s00_axi_awprot(s00_axi_awprot),
        .s00_axi_awvalid(s00_axi_awvalid), .s00_axi_awready(s00_axi_awready),
        .s00_axi_wdata(s00_axi_wdata), .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid), .s00_axi_wready(s00_axi_wready),
        .s00_axi_bresp(s00_axi_bresp), .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_araddr(s00_axi_araddr), .s00_axi_arprot(s00_axi_arprot),
        .s00_axi_arvalid(s00_axi_arvalid), .s00_axi_arready(s00_axi_arready),
        .s00_axi_rdata(s00_axi_rdata), .s00_axi_rresp(s00_axi_rresp),
        .s00_axi_rvalid(s00_axi_rvalid), .s00_axi_rready(s00_axi_rready)
    );

    assign led_osc = osc_div;   // podglad podzielonego sygnalu na LED

endmodule
