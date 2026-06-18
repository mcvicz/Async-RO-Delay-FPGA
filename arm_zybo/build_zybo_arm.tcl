#=============================================================================
# build_zybo_arm.tcl -- buduje od zera projekt Vivado 2018.3:
#   Zybo Z7-10 (xc7z010clg400-1) + Zynq PS7 (preset Zybo) + AXI4-Lite
#   + osc_axi_system (4 oscylatory + mux + prescaler /256 + freq_counter).
#   ARM czyta freq_count przez AXI, sweep tap, wypluwa na UART.
#
# WYMAGANIA PRZED URUCHOMIENIEM:
#   1. Board files Digilent zybo-z7-10 zainstalowane (Digilent vivado-boards
#      -> <Vivado>/data/boards/board_files/).
#   2. Vivado ZRESTARTOWANE po instalacji board files (laduja sie przy starcie!).
#
# UZYCIE (Vivado 2018.3 Tcl Console) -- dostosuj sciezke 'base' do swojego repo:
#   source .../Async-RO-Delay-FPGA/arm_zybo/build_zybo_arm.tcl
#
# Skrypt KONCZY na: BD zbudowany + zwalidowany + wrapper jako top.
# Bitstream/Export -> osobne komendy (zobacz README.md w tym folderze).
#=============================================================================

# sciezka do repo (dostosuj do swojej lokalizacji)
set base     "C:/Users/pmich/Desktop/EIT_2_0/SEM1/vivado/projekt/repo/Async-RO-Delay-FPGA"
set src      "$base/fpga_project/oscillator/oscillator.srcs/sources_1/new"
set xdc      "$base/arm_zybo/zybo_bd_pins.xdc"
set projdir  "$base/arm_zybo_build/vivado_proj"
set projname "osc_arm_zybo"
set bd_name  "system"

#--- 0. Zamknij ewentualny otwarty projekt -----------------------------------
catch { close_project }

#--- 1. Nowy projekt na Zybo Z7-10 -------------------------------------------
create_project $projname $projdir -part xc7z010clg400-1 -force

set bp [lindex [get_board_parts -quiet *zybo-z7-10*] 0]
if { $bp eq "" } {
    error "STOP: board part 'zybo-z7-10' NIE znaleziony. Zainstaluj board files i ZRESTARTUJ Vivado, potem uruchom skrypt ponownie."
}
set_property BOARD_PART $bp [current_project]
puts "INFO: BOARD_PART = $bp"

#--- 2. Dodaj RTL (TYLKO modul-liscie potrzebne przez osc_axi_system) --------
#    NIE dodajemy top_system.v ani top_system_zybo.v -> brak multi-top ambiguity.
add_files -norecurse [list \
    "$src/osc_axi_system.v" \
    "$src/freq_counter_axi.v" \
    "$src/freq_counter.v" \
    "$src/async_prescaler.v" \
    "$src/async_ro_carry.v" \
    "$src/async_ro_loopback.v" \
    "$src/async_ro_lut.v" \
    "$src/sync_baseline.v" \
]
update_compile_order -fileset sources_1

#--- 3. Dodaj constraints (piny Zybo dla portow PL wyprowadzonych z BD) -------
add_files -fileset constrs_1 -norecurse $xdc

#--- 4. Block Design ----------------------------------------------------------
create_bd_design $bd_name

# 4a. Zynq PS7 + preset Zybo (DDR3L / zegary / MIO / UART1 -- automatycznie)
set zynq [create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 zynq_ps]
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config { make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" } \
    $zynq

# 4b. Wymus: FCLK0 = 100 MHz (okno freq_counter = 100_000 cykli = 1 ms!),
#     M_AXI_GP0 on, UART1 on. To gwarantuje poprawna matematyke freq_khz.
set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_EN_CLK0_PORT {1} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_FCLK_CLK0_BUF {TRUE} \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
] $zynq

# 4c. Nasz modul jako module reference (AXI slave s00_axi auto-rozpoznany)
set osc [create_bd_cell -type module -reference osc_axi_system osc_axi_system_0]

# 4d. AXI automation: PS M_AXI_GP0 -> osc s00_axi (tworzy interconnect + reset + zegary)
apply_bd_automation -rule xilinx.com:bd_rule:axi4 \
    -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} \
              Master {/zynq_ps/M_AXI_GP0} Slave {/osc_axi_system_0/s00_axi} \
              ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0} } \
    [get_bd_intf_pins osc_axi_system_0/s00_axi]

# 4e. Wyprowadz porty PL na zewnatrz (powstana led_osc_0 / pmod_in_0 / pmod_out_0)
make_bd_pins_external [get_bd_pins osc_axi_system_0/led_osc]
make_bd_pins_external [get_bd_pins osc_axi_system_0/pmod_in]
make_bd_pins_external [get_bd_pins osc_axi_system_0/pmod_out]

# 4f. Adresy + walidacja + zapis
assign_bd_address
regenerate_bd_layout
validate_bd_design
save_bd_design

#--- 5. HDL wrapper + ustaw jako top -----------------------------------------
set bd_file [get_files ${bd_name}.bd]
make_wrapper -files $bd_file -top
set wrapper "[file rootname [file tail $bd_file]]_wrapper.v"
add_files -norecurse [file join [get_property DIRECTORY [current_project]] \
    "${projname}.srcs" "sources_1" "bd" $bd_name "hdl" $wrapper]
set_property top ${bd_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1

puts "============================================================="
puts "OK: BD '$bd_name' zbudowany i zwalidowany. Top = ${bd_name}_wrapper"
puts "Sprawdz Address Editor: osc_axi_system_0 s00_axi @ 0x43C00000"
puts ""
puts "DALEJ (osobne komendy -- patrz INSTRUKCJA.md KROK 3+):"
puts "  launch_runs synth_1 -jobs 4 ; wait_on_run synth_1"
puts "  launch_runs impl_1 -to_step write_bitstream -jobs 4 ; wait_on_run impl_1"
puts "============================================================="
