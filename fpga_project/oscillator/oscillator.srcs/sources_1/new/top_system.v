`timescale 1ns / 1ps
//=============================================================================
// TOP_SYSTEM -- modul najwyzszego poziomu
//
// Spina 4 warianty oscylatorow + frequency counter + diagnostyka LED.
//
// Wybor wariantu przez sw_mode[1:0]:
//  2'b00 -> sync_baseline (synchroniczny licznik, wewn. dzielnik /2^24)
//  2'b01 -> async_ro_carry  (CARRY4 ring, ~setki MHz)
//  2'b10 -> async_ro_loopback (IO loopback przez Pmod)
//  2'b11 -> async_ro_lut (15x LUT1 ring, ~setki MHz)
//
// UWAGA: Surowy mux bez prescalera. Sygnal asynchroniczny moze byc szybki
// (setki MHz) -- na LED osc bedzie wygladal constant lit, ale dla SDF sym
// i freq_counter (F4, dziala w domenie 100 MHz z 2FF synchronizer) to OK.
// Prescaler dodamy w F4 razem z pomiarem czestotliwosci.
//=============================================================================

module top_system (
    input  wire        clk_100mhz,
    input  wire        rst_n_btn,        // BTN0 -- active HIGH na ZedBoard
    input  wire [1:0]  sw_mode,          // wybor wariantu
    input  wire [5:0]  sw_tap,           // dlugosc petli CARRY4
    input  wire        pmod_in,
    output wire        pmod_out,
    output wire        led_alive,        // diagnostyka system zyje
    output wire [1:0]  led_variant,      // pokazuje sw_mode
    output wire        led_osc           // wyjscie oscylatora (surowe)
);

    // Reset: BTN0 active-HIGH -> wewn. active-LOW
    wire rst_n = ~rst_n_btn;

    //--- Sygnaly z 4 wariantow ---
    wire osc_sync;
    wire osc_carry;
    wire osc_loopback;
    wire osc_lut;

    //--- Wariant 0: sync_baseline ---
    sync_baseline #(.WIDTH(24)) inst_sync (
        .clk     (clk_100mhz),
        .rst_n   (rst_n),
        .enable  (1'b1),
        .osc_out (osc_sync)
    );

    //--- Wariant 1: CARRY4 ring ---
    async_ro_carry inst_carry (
        .enable     (1'b1),
        .tap_select (sw_tap),
        .osc_out    (osc_carry)
    );

    //--- Wariant 2: IO loopback (placeholder, Faza 6) ---
    async_ro_loopback inst_loopback (
        .enable   (1'b1),
        .pmod_in  (pmod_in),
        .pmod_out (pmod_out),
        .osc_out  (osc_loopback)
    );

    //--- Wariant 3: LUT1 ring (15 inwerterow) ---
    async_ro_lut #(.N_INVERTERS(15)) inst_lut (
        .enable  (1'b1),
        .osc_out (osc_lut)
    );

    //=============================================================================
    // MULTIPLEXER wyboru wariantu (surowy, bez prescalera)
    //=============================================================================
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

    //--- Frequency counter (F4: pelna implementacja z 2FF synchronizer) ---
    wire [31:0] freq_count;
    wire        freq_valid;

    freq_counter inst_fcount (
        .clk        (clk_100mhz),
        .rst_n      (rst_n),
        .osc_in     (osc_selected),
        .freq_count (freq_count),
        .valid      (freq_valid)
    );

    //=============================================================================
    // DIAGNOSTYKA
    //=============================================================================
    // LED alive: dzielnik /2^25 z zegara 100 MHz -> ~1.5 Hz
    reg [24:0] alive_cnt;
    always @(posedge clk_100mhz or negedge rst_n) begin
        if (!rst_n) alive_cnt <= 25'd0;
        else        alive_cnt <= alive_cnt + 1'b1;
    end

    assign led_alive   = alive_cnt[24];
    assign led_variant = sw_mode;
    assign led_osc     = osc_selected;

endmodule
