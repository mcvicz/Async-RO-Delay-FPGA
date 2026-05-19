`timescale 1ns / 1ps
//=============================================================================
// SYNC_BASELINE - synchroniczny licznik referencyjny
//
// Generator czêstotliwoœci oparty o dzielenie zegara 100 MHz.
// Punkt odniesienia dla porównania z asynchronicznymi wariantami.
//
// Parametr N kontroluje, który bit licznika idzie na wyjœcie (czyli
// efektywnie czêstotliwoœæ: f_out = 100MHz / 2^(N+1))
//
// Dla N=23: f_out ? 100MHz / 16.7M ? 6 Hz (widoczne miganie LED)
// Dla N=0: f_out = 50 MHz (toggle co takt)
//=============================================================================
module sync_baseline #(
    parameter WIDTH = 24 // szerokoœæ licznika
)(
    input wire clk, // zegar 100 MHz
    input wire rst_n, // reset aktywny niski
    input wire enable, // w³¹cz oscylator
    output wire osc_out // sygna³ wyjœciowy (do freq_counter)
);
    reg [WIDTH-1:0] counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            counter <= {WIDTH{1'b0}};
        else if (enable)
            counter <= counter + 1'b1;
        end
// MSB licznika jako wyjœcie - daje sygna³ o najni¿szej czêstotliwoœci,
// ale mo¿na te¿ wyprowadziæ counter[0] dla maksymalnej (50 MHz toggle)
    assign osc_out = counter[WIDTH-1];
endmodule