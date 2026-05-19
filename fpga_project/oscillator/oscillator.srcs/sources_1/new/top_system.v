`timescale 1ns / 1ps
//=============================================================================
// TOP_SYSTEM - modu³ najwy¿szego poziomu projektu
//
// £¹czy wszystkie trzy warianty generatorów (sync, async_carry, async_loopback),
// multiplekser wyboru wariantu, frequency counter, oraz wyjœcia diagnostyczne.
//
// Wybór wariantu poprzez DIP switches:
//  sw_mode = 2'b00 -> sync_baseline
//  sw_mode = 2'b01 -> async_carry
//  sw_mode = 2'b10 -> async_loopback
//=============================================================================
module top_system (
    // zegar i reset
    input wire clk_100mhz,
    input wire rst_n_btn,           // BTN0 - uwaga: na ZedBoard przyciski s¹ active-high
    
    // Prze³¹czniki
    input wire [1:0] sw_mode,       // wybór wariantu generatora
    input wire [5:0] sw_tap,        // d³ugoœæ pêtli CARRY4
    
    // Pmod (dla wariantu loopback)
    input wire pmod_in,
    output wire pmod_out,
    
    // LED diagnostyczne
    output wire led_alive,          // miga z dzielnikiem, dowód ¿e system ¿yje
    output wire [1:0] led_variant   // pokazuje aktywny wariant
);

    // Reset: BTN0 na ZedBoard jest active-high, my chcemy active-low
    wire rst_n = ~rst_n_btn;

    // Sygna³y z trzech wariantów
    wire osc_sync;
    wire osc_carry;
    wire osc_loopback;
    
    // Wybrany sygna³ z multipleksera
    reg osc_selected;
    
   // Instancje wariantów
    sync_baseline #(.WIDTH(24)) inst_sync (
        .clk (clk_100mhz),
        .rst_n (rst_n),
        .enable (1'b1),
        .osc_out (osc_sync)
    );
    async_ro_carry inst_carry (
        .enable (1'b1),
        .tap_select (sw_tap),
        .osc_out (osc_carry)
    );
    async_ro_loopback inst_loopback (
        .enable (1'b1),
        .pmod_in (pmod_in),
        .pmod_out (pmod_out),
        .osc_out (osc_loopback)
    );

    // Multiplekser wyboru wariantu
    always @(*) begin
        case (sw_mode)
            2'b00: osc_selected = osc_sync;
            2'b01: osc_selected = osc_carry;
            2'b10: osc_selected = osc_loopback;
            default: osc_selected = 1'b0;
        endcase
    end
    
    // Frequency counter
    wire [31:0] freq_count;
    wire freq_valid;
    
    freq_counter inst_fcount (
        .clk (clk_100mhz),
        .rst_n (rst_n),
        .osc_in (osc_selected),
        .freq_count (freq_count),
        .valid (freq_valid)
    );

    // Diagnostyka: LED alive (dzielenie zegara)
    reg [24:0] alive_cnt;
    always @(posedge clk_100mhz or negedge rst_n) begin
        if (!rst_n) alive_cnt <= 25'd0;
        else alive_cnt <= alive_cnt + 1'b1;
    end
    assign led_alive = alive_cnt[24]; // ~1.5 Hz @ 100 MHz
    assign led_variant = sw_mode;
    
endmodule