`timescale 1ns / 1ps
//=============================================================================
// ASYNC_PRESCALER -- dzielnik czestotliwosci w domenie asynchronicznej
//
// Ripple counter taktowany sygnalem ring oscillatora. Dzieli f przez 2^DIV_BITS.
// Wyjscie = MSB licznika (najwolniejszy bit).
//
// PO CO:
//   Ring oscyluje setki MHz. freq_counter @100MHz mierzy max ~50MHz (Nyquist).
//   Prescaler dzieli f PRZED synchronizerem 2FF -> wolny sygnal mierzalny.
//   Realna f_osc = (freq_count / okno_czasowe) * 2^DIV_BITS.
//
// UWAGA HW:
//   osc_in pelni role zegara -> synthesis warning (clock na general routing).
//   Dla ringu wewnetrznego (carry/lut) routuje OK mimo warningu.
//   Dla loopback (pin Pmod) wymaga CLOCK_DEDICATED_ROUTE FALSE w XDC.
//=============================================================================

module async_prescaler #(
    parameter DIV_BITS = 8   // /256 domyslnie
)(
    input  wire osc_in,      // szybki sygnal async (ring)
    input  wire rst_n,
    output wire osc_div      // podzielony sygnal (wolny, mierzalny)
);

    (* keep = "true" *) reg [DIV_BITS-1:0] cnt;

    always @(posedge osc_in or negedge rst_n) begin
        if (!rst_n) cnt <= {DIV_BITS{1'b0}};
        else        cnt <= cnt + 1'b1;
    end

    // MSB togglje co 2^DIV_BITS zbocz wejscia -> dzielenie przez 2^DIV_BITS
    assign osc_div = cnt[DIV_BITS-1];

endmodule
