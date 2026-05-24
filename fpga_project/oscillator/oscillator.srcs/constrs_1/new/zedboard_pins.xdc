#=============================================================================
# ZEDBOARD PIN MAPPING + ASYNC CONSTRAINTS
# Part: xc7z020clg484-1, board: ZedBoard
#=============================================================================

#--- ZEGAR 100 MHz ---
set_property -dict { PACKAGE_PIN Y9 IOSTANDARD LVCMOS33 } [get_ports clk_100mhz]
create_clock -period 10.000 -name sys_clk [get_ports clk_100mhz]

#--- PRZYCISK RESET (BTNC) ---
set_property -dict { PACKAGE_PIN P16 IOSTANDARD LVCMOS33 } [get_ports rst_n_btn]

#--- DIP SWITCHES -- wybor wariantu (SW0, SW1) ---
set_property -dict { PACKAGE_PIN F22 IOSTANDARD LVCMOS33 } [get_ports {sw_mode[0]}]
set_property -dict { PACKAGE_PIN G22 IOSTANDARD LVCMOS33 } [get_ports {sw_mode[1]}]

#--- DIP SWITCHES -- tap selector (SW2-SW7) ---
set_property -dict { PACKAGE_PIN H22 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[0]}]
set_property -dict { PACKAGE_PIN F21 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[1]}]
set_property -dict { PACKAGE_PIN H19 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[2]}]
set_property -dict { PACKAGE_PIN H18 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[3]}]
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[4]}]
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33 } [get_ports {sw_tap[5]}]

#--- LED-Y ---
set_property -dict { PACKAGE_PIN T22 IOSTANDARD LVCMOS33 } [get_ports led_alive]
set_property -dict { PACKAGE_PIN T21 IOSTANDARD LVCMOS33 } [get_ports {led_variant[0]}]
set_property -dict { PACKAGE_PIN U22 IOSTANDARD LVCMOS33 } [get_ports {led_variant[1]}]
set_property -dict { PACKAGE_PIN U21 IOSTANDARD LVCMOS33 } [get_ports led_osc]

#--- PMOD JA (IO Loopback -- Faza 6) ---
set_property -dict { PACKAGE_PIN Y11 IOSTANDARD LVCMOS33 } [get_ports pmod_out]
set_property -dict { PACKAGE_PIN AA11 IOSTANDARD LVCMOS33 } [get_ports pmod_in]

#=============================================================================
# ASYNCHRONOUS RING OSCILLATORS -- false_path
#=============================================================================
# Wylaczenie analizy timing dla petli kombinacyjnych.
# CARRY4 ring
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/selected_tap*}]

# LUT1 ring (15 inwerterow)
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/chain*}]

#=============================================================================
# LOC -- celowo BRAK
#=============================================================================
# Pierwotnie probowalismy LOC SLICE_X8Y50..Y113 -- SLICE_X8 nie istnieje w
# Zynq 7020 fabric (kolumny SLICE sparse, niektore to BRAM/DSP).
# Vivado SAM organizuje CARRY4 cascade prawidlowo bez LOC -- placement OK,
# routing OK, timing OK. LOC opcjonalny dla powtarzalnosci miedzy syntezami,
# nie krytyczny dla F2. Doprecyzujemy w F7 jak bedziemy mierzyc f.
