#=============================================================================
# ZYBO Z7-10 PIN MAPPING
# Part: xc7z010clg400-1, board: Zybo Z7-10
#
# UZYCIE: aktywuj ten XDC, dezaktywuj zedboard_pins.xdc.
# W Vivado: prawym na zedboard_pins.xdc -> Properties -> odznacz used_in_*
#
# Top module musi byc: top_system_zybo (nie top_system!)
#=============================================================================

#--- ZEGAR 125 MHz ---
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports clk_125mhz]
create_clock -period 8.000 -name sys_clk [get_ports clk_125mhz]

#--- PRZYCISK RESET (BTN0) ---
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports rst_n_btn]

#--- DIP SWITCHES -- wybor wariantu (SW0, SW1) ---
set_property -dict { PACKAGE_PIN G15 IOSTANDARD LVCMOS33 } [get_ports {sw_mode[0]}]
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports {sw_mode[1]}]

#--- DIP SWITCHES -- tap selector (SW2, SW3) ---
set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports {sw_tap_short[0]}]
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports {sw_tap_short[1]}]

#--- LED-Y ---
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports led_alive]
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33 } [get_ports {led_variant[0]}]
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports {led_variant[1]}]
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports led_osc]

#--- PMOD JE (IO Loopback -- Faza 6) ---
# JE1 jako wyjscie petli, JE2 jako wejscie petli
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports pmod_out]
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports pmod_in]

#=============================================================================
# ASYNCHRONOUS RING OSCILLATORS -- false_path
#=============================================================================
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/selected_tap*}]

set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/chain*}]

#=============================================================================
# ALLOW_COMBINATORIAL_LOOPS -- celowa petla (ring). Bez tego DRC LUTLP-1
# blokuje write_bitstream. Combined filter (XDC bez foreach/if).
#=============================================================================
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -quiet -hier -filter { \
    NAME =~ *inst_lut/chain* || NAME =~ *inst_lut/ring_feedback* || \
    NAME =~ *inst_lut/loop_in* || NAME =~ *inst_carry/tap_bus* || \
    NAME =~ *inst_carry/ring_feedback* || NAME =~ *inst_carry/loop_in* }]
