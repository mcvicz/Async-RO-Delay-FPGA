#=============================================================================
# BD_PINS -- constraints dla flow Block Design (Zynq PS + osc_axi_system)
#
# Przy BD: zegar, UART, DDR ida przez PS MIO/FIXED_IO -> NIE potrzebuja XDC.
# Tylko sygnaly PL wyprowadzone na zewnatrz (led_osc, pmod) wymagaja pinow.
#
# UZYCIE: aktywny gdy top = system_wrapper.
#         Dezaktywuj zedboard_pins.xdc (porty top_system nie istnieja w BD).
#
# Nazwy portow zaleza od make_bd_pins_external -> zwykle z sufiksem _0.
# Sprawdz dokladne nazwy: get_ports w Tcl po synth.
#=============================================================================

# led_osc -> LD3 ZedBoard
set_property -dict { PACKAGE_PIN U21 IOSTANDARD LVCMOS33 } [get_ports led_osc_0]

# Pmod JA -- loopback
set_property -dict { PACKAGE_PIN Y11  IOSTANDARD LVCMOS33 } [get_ports pmod_out_0]
set_property -dict { PACKAGE_PIN AA11 IOSTANDARD LVCMOS33 } [get_ports pmod_in_0]

# false_path dla petli async (te same co przedtem, hierarchia w BD)
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_carry/selected_tap*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/ring_feedback*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/loop_in*}]
set_false_path -through [get_nets -hier -filter {NAME =~ *inst_lut/chain*}]

#=============================================================================
# ALLOW_COMBINATORIAL_LOOPS -- celowa petla kombinacyjna (ring oscillator)
# Bez tego DRC LUTLP-1 blokuje write_bitstream. Potwierdzamy ze petla jest
# zamierzona (to istota projektu -- async ring oscillator).
#=============================================================================
# Jeden combined filter (XDC nie wspiera foreach/if). Lista niepusta bo
# inst_lut/chain zawsze istnieje (to ta petla flagowana przez LUTLP).
# Carry nets dolaczone -- jak nie istnieja w netliscie, po prostu pominiete.
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets -quiet -hier -filter { \
    NAME =~ *inst_lut/chain* || NAME =~ *inst_lut/ring_feedback* || \
    NAME =~ *inst_lut/loop_in* || NAME =~ *inst_carry/tap_bus* || \
    NAME =~ *inst_carry/ring_feedback* || NAME =~ *inst_carry/loop_in* }]
