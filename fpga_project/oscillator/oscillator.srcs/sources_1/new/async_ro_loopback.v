`timescale 1ns / 1ps
//=============================================================================
// ASYNC_RO_LOOPBACK -- ring oscillator zamkniety FIZYCZNIE poza FPGA (Pmod)
//
// Petla: inwerter -> OBUF -> pin JE1 -> [ZWORKA] -> pin JE2 -> IBUF -> inwerter
//
// Nieparzysta inwersja (1) + zewnetrzne sprzezenie -> oscylacja gdy zworka
// zalozona. Czestotliwosc niska (kilka-kilkanascie MHz) -- dominuje opoznienie
// buforow IO + sciezki PCB + zworki. Najczystszy przyklad async POZA krzemem.
//
// WAZNE:
//  - Petla zamknieta ZEWNETRZNIE -> brak wewnetrznej petli kombinacyjnej,
//    wiec NIE trzeba ALLOW_COMBINATORIAL_LOOPS (loop jest off-chip).
//  - pmod_in (pin) trafia jako zegar do prescalera -> wymaga
//    CLOCK_DEDICATED_ROUTE FALSE w XDC (pin -> BUFG nie jest dedykowany).
//  - Bez zworki: pmod_in plywa -> brak oscylacji (oczekiwane).
//=============================================================================

module async_ro_loopback (
    input  wire enable,
    input  wire pmod_in,    // sygnal wraca z zewnatrz (przez zworke JE2)
    output wire pmod_out,   // sygnal wychodzi na pin (JE1)
    output wire osc_out     // do pomiaru (freq_counter)
);

    // Inwerter + bramka enable. pmod_in to stan po petli zewnetrznej.
    // enable=0 -> pmod_out=0 (petla otwarta, stop).
    (* dont_touch = "true", keep = "true" *) wire feedback;
    assign feedback = enable & ~pmod_in;

    assign pmod_out = feedback;   // -> OBUF -> JE1 -> zworka -> JE2 -> pmod_in
    assign osc_out  = pmod_in;    // sygnal oscylujacy do licznika

endmodule
