`timescale 1ns / 1ps
//=============================================================================
// FREQ_COUNTER_AXI -- AXI4-Lite slave opakowujacy freq_counter
//
// Pozwala procesorowi ARM (Zynq PS) odczytac zmierzona czestotliwosc
// oraz sterowac wyborem wariantu oscylatora i prescalerem.
//
// MAPA REJESTROW (offset od bazy AXI):
//   0x00 REG0 freq_count [31:0]   -- RO, ostatni pomiar (zbocza w oknie)
//   0x04 REG1 control             -- RW, [1:0]=osc_select, [2]=enable
//   0x08 REG2 status              -- RO, [0]=valid (nowy pomiar dostepny)
//   0x0C REG3 tap_select [5:0]    -- RW, dlugosc petli CARRY4
//
// Nazwy portow s00_axi_* -> Vivado auto-rozpoznaje interfejs AXI w BD.
//=============================================================================

module freq_counter_axi #(
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 4
)(
    // Sygnaly uzytkowe (do PL)
    input  wire        osc_in,        // wybrany sygnal oscylatora (po prescalerze)
    output wire [1:0]  osc_select,    // sterowanie mux wariantu (do top)
    output wire        osc_enable,    // enable oscylatora
    output wire [5:0]  tap_select,    // dlugosc petli CARRY4

    // AXI4-Lite slave interface
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

    //=========================================================================
    // freq_counter -- mierzy osc_in w domenie AXI clk (zwykle 100 MHz z PS)
    //=========================================================================
    wire [31:0] freq_count;
    wire        freq_valid;

    freq_counter #(.WINDOW_CYCLES(100_000)) inst_fc (
        .clk        (s00_axi_aclk),
        .rst_n      (s00_axi_aresetn),
        .osc_in     (osc_in),
        .freq_count (freq_count),
        .valid      (freq_valid)
    );

    // Latch valid -> status sticky do odczytu, kasowany po read REG2
    reg valid_sticky;
    // (kasowanie obsluzone nizej przy read REG2)

    //=========================================================================
    // Rejestry sterujace (REG1, REG3) -- zapisywalne przez AXI
    //=========================================================================
    reg [C_S_AXI_DATA_WIDTH-1:0] reg_control;   // REG1
    reg [C_S_AXI_DATA_WIDTH-1:0] reg_tap;       // REG3

    assign osc_select = reg_control[1:0];
    assign osc_enable = reg_control[2];
    assign tap_select = reg_tap[5:0];

    //=========================================================================
    // AXI4-Lite WRITE channel
    //=========================================================================
    reg axi_awready, axi_wready, axi_bvalid;
    reg [1:0] axi_bresp;
    reg [C_S_AXI_ADDR_WIDTH-1:0] axi_awaddr;

    assign s00_axi_awready = axi_awready;
    assign s00_axi_wready  = axi_wready;
    assign s00_axi_bresp   = axi_bresp;
    assign s00_axi_bvalid  = axi_bvalid;

    wire write_en = axi_awready & s00_axi_awvalid & axi_wready & s00_axi_wvalid;

    // awready
    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) axi_awready <= 1'b0;
        else if (!axi_awready && s00_axi_awvalid && s00_axi_wvalid)
            axi_awready <= 1'b1;
        else axi_awready <= 1'b0;
    end
    // awaddr latch
    always @(posedge s00_axi_aclk) begin
        if (!axi_awready && s00_axi_awvalid && s00_axi_wvalid)
            axi_awaddr <= s00_axi_awaddr;
    end
    // wready
    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) axi_wready <= 1'b0;
        else if (!axi_wready && s00_axi_wvalid && s00_axi_awvalid)
            axi_wready <= 1'b1;
        else axi_wready <= 1'b0;
    end
    // register write
    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) begin
            reg_control <= 32'd0;
            reg_tap     <= 32'd63;   // domyslnie pelna petla
        end else if (write_en) begin
            case (axi_awaddr[C_S_AXI_ADDR_WIDTH-1:2])
                2'h1: reg_control <= s00_axi_wdata;   // 0x04
                2'h3: reg_tap     <= s00_axi_wdata;   // 0x0C
                default: ;
            endcase
        end
    end
    // write response
    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) begin
            axi_bvalid <= 1'b0;
            axi_bresp  <= 2'b0;
        end else if (write_en && !axi_bvalid) begin
            axi_bvalid <= 1'b1;
            axi_bresp  <= 2'b0;   // OKAY
        end else if (s00_axi_bready && axi_bvalid) begin
            axi_bvalid <= 1'b0;
        end
    end

    //=========================================================================
    // AXI4-Lite READ channel
    //=========================================================================
    reg axi_arready, axi_rvalid;
    reg [1:0] axi_rresp;
    reg [C_S_AXI_ADDR_WIDTH-1:0] axi_araddr;
    reg [C_S_AXI_DATA_WIDTH-1:0] axi_rdata;

    assign s00_axi_arready = axi_arready;
    assign s00_axi_rvalid  = axi_rvalid;
    assign s00_axi_rresp   = axi_rresp;
    assign s00_axi_rdata   = axi_rdata;

    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) axi_arready <= 1'b0;
        else if (!axi_arready && s00_axi_arvalid) begin
            axi_arready <= 1'b1;
            axi_araddr  <= s00_axi_araddr;
        end else axi_arready <= 1'b0;
    end

    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) axi_rvalid <= 1'b0;
        else if (axi_arready && s00_axi_arvalid && !axi_rvalid) begin
            axi_rvalid <= 1'b1;
            axi_rresp  <= 2'b0;
        end else if (axi_rvalid && s00_axi_rready) begin
            axi_rvalid <= 1'b0;
        end
    end

    // valid_sticky: set gdy nowy pomiar, clear gdy odczyt REG2
    wire read_reg2 = axi_arready && s00_axi_arvalid &&
                     (s00_axi_araddr[C_S_AXI_ADDR_WIDTH-1:2] == 2'h2);
    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn)      valid_sticky <= 1'b0;
        else if (freq_valid)       valid_sticky <= 1'b1;
        else if (read_reg2)        valid_sticky <= 1'b0;
    end

    // read mux
    always @(*) begin
        case (axi_araddr[C_S_AXI_ADDR_WIDTH-1:2])
            2'h0: axi_rdata = freq_count;              // REG0 freq
            2'h1: axi_rdata = reg_control;             // REG1 control
            2'h2: axi_rdata = {31'd0, valid_sticky};   // REG2 status
            2'h3: axi_rdata = reg_tap;                 // REG3 tap
            default: axi_rdata = 32'hDEADBEEF;
        endcase
    end

endmodule
