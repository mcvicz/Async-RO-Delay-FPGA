`timescale 1ns / 1ps
//=============================================================================
// TOP_SYSTEM_ZYBO -- wariant dla Zybo Z7-10 (XC7Z010)
//
// Rozni sie od top_system.v (ZedBoard):
//  - clk 125 MHz (zamiast 100 MHz)
//  - tylko 4 switche -> 2 mode + 2 tap (mapping na 4 wartosci z 64)
//  - tylko 4 LED
//  - Pmod JE (zamiast JA)
//
// Mapping sw_tap[1:0] -> tap_select[5:0]:
//   2'b00 -> tap_select = 6'd15  (N=16 stopni)
//   2'b01 -> tap_select = 6'd31  (N=32 stopni)
//   2'b10 -> tap_select = 6'd47  (N=48 stopni)
//   2'b11 -> tap_select = 6'd63  (N=64 stopni)
//=============================================================================

module top_system_zybo (
    input  wire        clk_125mhz,
    input  wire        rst_n_btn,        // BTN0 -- active HIGH
    input  wire [1:0]  sw_mode,          // wybor wariantu (SW0, SW1)
    input  wire [1:0]  sw_tap_short,     // tap selector (SW2, SW3)
    input  wire        pmod_in,
    output wire        pmod_out,
    output wire        led_alive,        // LD0
    output wire [1:0]  led_variant,      // LD1, LD2
    output wire        led_osc           // LD3
);

    wire rst_n = ~rst_n_btn;

    //--- Mapping sw_tap_short -> tap_select 6-bit ---
    reg [5:0] tap_select;
    always @(*) begin
        case (sw_tap_short)
            2'b00:   tap_select = 6'd15;
            2'b01:   tap_select = 6'd31;
            2'b10:   tap_select = 6'd47;
            2'b11:   tap_select = 6'd63;
            default: tap_select = 6'd63;
        endcase
    end

    //--- Sygnaly z 4 wariantow ---
    wire osc_sync;
    wire osc_carry;
    wire osc_loopback;
    wire osc_lut;

    //--- Wariant 0: sync_baseline ---
    sync_baseline #(.WIDTH(24)) inst_sync (
        .clk     (clk_125mhz),
        .rst_n   (rst_n),
        .enable  (1'b1),
        .osc_out (osc_sync)
    );

    //--- Wariant 1: CARRY4 ring ---
    async_ro_carry inst_carry (
        .enable     (1'b1),
        .tap_select (tap_select),
        .osc_out    (osc_carry)
    );

    //--- Wariant 2: IO loopback ---
    async_ro_loopback inst_loopback (
        .enable   (1'b1),
        .pmod_in  (pmod_in),
        .pmod_out (pmod_out),
        .osc_out  (osc_loopback)
    );

    //--- Wariant 3: LUT1 ring ---
    async_ro_lut #(.N_INVERTERS(15)) inst_lut (
        .enable  (1'b1),
        .osc_out (osc_lut)
    );

    //--- Mux wyboru wariantu ---
    reg osc_selected;
    always @(*) begin
        case (sw_mode)
            2'b00:   osc_selected = osc_sync;
            2'b01:   osc_selected = osc_carry;
            2'b10:   osc_selected = osc_loopback;
            2'b11:   osc_selected = osc_lut;
            default: osc_selected = 1'b0;
        endcase
    end

    //--- Frequency counter (parametr WINDOW dostosowany do 125 MHz) ---
    wire [31:0] freq_count;
    wire        freq_valid;

    freq_counter #(.WINDOW_CYCLES(125_000)) inst_fcount (   // 1 ms @ 125 MHz
        .clk        (clk_125mhz),
        .rst_n      (rst_n),
        .osc_in     (osc_selected),
        .freq_count (freq_count),
        .valid      (freq_valid)
    );

    //--- Diagnostyka LED ---
    // alive_cnt[24] @ 125 MHz -> ~1.9 Hz, dobrze widoczne
    reg [24:0] alive_cnt;
    always @(posedge clk_125mhz or negedge rst_n) begin
        if (!rst_n) alive_cnt <= 25'd0;
        else        alive_cnt <= alive_cnt + 1'b1;
    end

    assign led_alive   = alive_cnt[24];
    assign led_variant = sw_mode;
    assign led_osc     = osc_selected;

endmodule
