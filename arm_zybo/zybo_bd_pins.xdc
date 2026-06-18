#=============================================================================
# zybo_bd_pins.xdc -- constraints dla flow Block Design na Zybo Z7-10
#
# Zegar/UART/DDR ida przez PS7 (FIXED_IO/MIO) -> NIE potrzebuja XDC.
# Tylko porty PL wyprowadzone z BD (make_bd_pins_external) wymagaja pinow.
# Nazwy z sufiksem _0 (tak nazywa je make_bd_pins_external).
#
# Piny Zybo Z7-10:
#   led_osc_0  -> LD3 (D18)
#   pmod_out_0 -> Pmod JE1 (V12)
#   pmod_in_0  -> Pmod JE2 (W16)   [loopback: zworka JE1<->JE2]
#=============================================================================

set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports led_osc_0]
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports pmod_out_0]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports pmod_in_0]

#=============================================================================
# ASYNCHRONOUS RING OSCILLATORS -- false_path (hierarchia w BD: system_i/osc_axi_system_0/...)
#=============================================================================
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/selected_tap*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/chain*}]

#=============================================================================
# ALLOW_COMBINATORIAL_LOOPS -- celowa petla ring (bez tego DRC LUTLP-1 blokuje
# write_bitstream). Jeden combined filter (XDC bez foreach/if).
#=============================================================================
# UWAGA: -quiet MUSI byc na set_property (zewnetrzne), nie tylko na get_nets.
# Inaczej pusta lista netow -> ERROR [Common 17-55] "expects at least one object"
# -> abort syntezy. -quiet na set_property => TCL_OK nawet przy pustej liscie.
set_property -quiet ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -quiet -hier -filter { \
    NAME =~ *inst_lut/chain* || NAME =~ *inst_lut/ring_feedback* || \
    NAME =~ *inst_lut/loop_in* || NAME =~ *inst_carry/tap_bus* || \
    NAME =~ *inst_carry/ring_feedback* || NAME =~ *inst_carry/loop_in* }]

#=============================================================================
# LOOPBACK -- pmod_in / osc_selected jako zegar prescalera (general routing,
# nie dedykowany BUFG) -> override, inaczej IO Clock Placer error.
# -quiet na set_property => brak abortu gdy filtr nic nie zlapie (np. pre-synth).
#=============================================================================
set_property -quiet CLOCK_DEDICATED_ROUTE FALSE [get_nets -quiet -hier -filter {NAME =~ *pmod_in*IBUF* || NAME =~ *osc_selected*}]
