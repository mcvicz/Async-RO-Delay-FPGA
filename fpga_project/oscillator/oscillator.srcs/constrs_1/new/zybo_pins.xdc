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
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports clk_125mhz]
create_clock -period 8.000 -name sys_clk [get_ports clk_125mhz]

#--- PRZYCISK RESET (BTN0) ---
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports rst_n_btn]

#--- DIP SWITCHES -- wybor wariantu (SW0, SW1) ---
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports {sw_mode[0]}]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {sw_mode[1]}]

#--- DIP SWITCHES -- tap selector (SW2, SW3) ---
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {sw_tap_short[0]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {sw_tap_short[1]}]

#--- LED-Y ---
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports led_alive]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {led_variant[0]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {led_variant[1]}]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports led_osc]

#--- PMOD JE (IO Loopback -- Faza 6) ---
# JE1 jako wyjscie petli, JE2 jako wejscie petli
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports pmod_out]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports pmod_in]

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
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets -quiet -hier -filter { NAME =~ *inst_lut/chain* || NAME =~ *inst_lut/ring_feedback* || NAME =~ *inst_lut/loop_in* || NAME =~ *inst_carry/tap_bus* || NAME =~ *inst_carry/ring_feedback* || NAME =~ *inst_carry/loop_in* }]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_125mhz_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {dbg_sw_tap[0]} {dbg_sw_tap[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {freq_count[0]} {freq_count[1]} {freq_count[2]} {freq_count[3]} {freq_count[4]} {freq_count[5]} {freq_count[6]} {freq_count[7]} {freq_count[8]} {freq_count[9]} {freq_count[10]} {freq_count[11]} {freq_count[12]} {freq_count[13]} {freq_count[14]} {freq_count[15]} {freq_count[16]} {freq_count[17]} {freq_count[18]} {freq_count[19]} {freq_count[20]} {freq_count[21]} {freq_count[22]} {freq_count[23]} {freq_count[24]} {freq_count[25]} {freq_count[26]} {freq_count[27]} {freq_count[28]} {freq_count[29]} {freq_count[30]} {freq_count[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {dbg_sw_mode[0]} {dbg_sw_mode[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list freq_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_125mhz_IBUF_BUFG]

#=============================================================================
# LOOPBACK -- pmod_in pelni role zegara (przez mux->prescaler).
# Pin -> BUFG nie jest dedykowany -> override, inaczej IO Clock Placer error.
#=============================================================================
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -quiet pmod_in_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -quiet -hier -filter {NAME =~ *pmod_in_IBUF*}]
