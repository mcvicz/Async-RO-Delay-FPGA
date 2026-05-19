#=============================================================================
# Pin mapping dla ZedBoard (Zynq-7020, xc7z020clg484-1)
#=============================================================================

#--- ZEGAR 100 MHz ---
set_property -dict { PACKAGE_PIN Y9 IOSTANDARD LVCMOS33 } [get_ports clk_100mhz]
create_clock -period 10.000 -name sys_clk [get_ports clk_100mhz]

#--- PRZYCISK RESET (BTNC) ---
set_property -dict { PACKAGE_PIN P16 IOSTANDARD LVCMOS33 } [get_ports rst_n_btn]

#--- DIP SWITCHES - wybór wariantu (SW0, SW1) ---
set_property -dict { PACKAGE_PIN F22 IOSTANDARD LVCMOS33 } [get_ports {sw_mode[0]}]
set_property -dict { PACKAGE_PIN G22 IOSTANDARD LVCMOS33 } [get_ports {sw_mode[1]}]

#--- DIP SWITCHES - tap selector (SW2-SW7) - czêœciowo, dodamy w Fazie 3 ---
set_property -dict { PACKAGE_PIN H22 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[0]}]
set_property -dict { PACKAGE_PIN F21 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[1]}]
set_property -dict { PACKAGE_PIN H19 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[2]}]
set_property -dict { PACKAGE_PIN H18 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[3]}]
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[4]}]
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[5]}]

#--- LED-Y ---
# led_alive -> LD0 (najbardziej na lewo)
set_property -dict { PACKAGE_PIN T22 IOSTANDARD LVCMOS33 } [get_ports led_alive]
# led_variant[0] -> LD1, led_variant[1] -> LD2
set_property -dict { PACKAGE_PIN T21 IOSTANDARD LVCMOS33 } [get_ports {led_variant[0]}]
set_property -dict { PACKAGE_PIN U22 IOSTANDARD LVCMOS33 } [get_ports {led_variant[1]}]

#--- PMOD JA (do wariantu IO Loopback - 6) ---
# JA1 jako wyjœcie pêtli, JA2 jako wejœcie pêtli
set_property -dict { PACKAGE_PIN Y11 IOSTANDARD LVCMOS33 } [get_ports pmod_out]
set_property -dict { PACKAGE_PIN AA11 IOSTANDARD LVCMOS33 } [get_ports pmod_in]

#=============================================================================
# ATRYBUTY ASYNCHRONICZNE
#=============================================================================
# Na razie zakomentowane, dodamy gdy bêdziemy mieli realny ring oscillator
#
# set_false_path -through [get_nets -hier -filter {NAME =~ *ring_loop*}]
# set_property LOC SLICE_X10Y20 [get_cells inst_carry/gen_carry[0].carry_stage]