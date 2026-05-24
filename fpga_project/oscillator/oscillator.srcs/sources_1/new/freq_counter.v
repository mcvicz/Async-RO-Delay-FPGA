`timescale 1ns / 1ps
//=============================================================================
// FREQ_COUNTER -- licznik czestotliwosci z oknem 1 ms
//
// Mierzy czestotliwosc sygnalu async (osc_in) przez zliczanie zboczy w
// oknie czasowym wyznaczonym zegarem 100 MHz.
//
// Okno = 100_000 cykli @ 100 MHz = 1 ms
// freq_count = liczba zboczy w 1 ms = czestotliwosc w kHz
// (dla pelnej w Hz mnoz przez 1000 w PS lub Python)
//
// 2-stopniowy synchronizer (2FF) na wejsciu osc_in -- chroni przed
// metastabilnoscia przy przekroczeniu domeny zegarowej.
//
// Wykrywanie zboczy: porownanie sync_reg z poprzednim stanem.
//
// Po zakonczeniu okna: freq_count = aktualna wartosc, valid pulse na 1 takt,
// counter reset, start nowego okna.
//=============================================================================

module freq_counter #(
    parameter WINDOW_CYCLES = 100_000   // 1 ms @ 100 MHz
)(
    input  wire        clk,             // zegar 100 MHz
    input  wire        rst_n,           // reset active-low
    input  wire        osc_in,          // sygnal async do pomiaru
    output reg  [31:0] freq_count,      // wynik (zbocza w 1 ms)
    output reg         valid            // pulse na 1 takt gdy nowy wynik
);

    //--- 2-stopniowy synchronizer ---
    reg sync_ff1, sync_ff2, sync_ff3;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sync_ff1 <= 1'b0;
            sync_ff2 <= 1'b0;
            sync_ff3 <= 1'b0;
        end else begin
            sync_ff1 <= osc_in;       // 1-szy FF -- moze byc metastabilny
            sync_ff2 <= sync_ff1;     // 2-gi FF -- stabilny
            sync_ff3 <= sync_ff2;     // do detekcji zbocza
        end
    end

    // Wykrycie narastajacego zbocza (rising edge)
    wire edge_detected = sync_ff2 & ~sync_ff3;

    //--- Licznik okna 1 ms ---
    reg [16:0] window_cnt;   // 17 bit wystarczy na 100_000 (max 131_072)
    wire window_done = (window_cnt == WINDOW_CYCLES - 1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)         window_cnt <= 17'd0;
        else if (window_done) window_cnt <= 17'd0;
        else                window_cnt <= window_cnt + 1'b1;
    end

    //--- Licznik zboczy (akumuluje w trakcie okna) ---
    reg [31:0] edge_cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)            edge_cnt <= 32'd0;
        else if (window_done)  edge_cnt <= 32'd0;             // reset na koniec okna
        else if (edge_detected) edge_cnt <= edge_cnt + 1'b1;  // zlicz zbocze
    end

    //--- Rejestr wynikowy + flaga valid ---
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            freq_count <= 32'd0;
            valid      <= 1'b0;
        end else if (window_done) begin
            freq_count <= edge_cnt;
            valid      <= 1'b1;
        end else begin
            valid      <= 1'b0;
        end
    end

endmodule
