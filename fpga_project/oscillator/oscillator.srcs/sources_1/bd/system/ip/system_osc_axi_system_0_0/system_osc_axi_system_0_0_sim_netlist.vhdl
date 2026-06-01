-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Jun  2 00:47:21 2026
-- Host        : Mcvicz running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/pmich/Desktop/EIT_2_0/SEM1/vivado/projekt/repo/Async-RO-Delay-FPGA/fpga_project/oscillator/oscillator.srcs/sources_1/bd/system/ip/system_osc_axi_system_0_0/system_osc_axi_system_0_0_sim_netlist.vhdl
-- Design      : system_osc_axi_system_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0_async_prescaler is
  port (
    led_osc : out STD_LOGIC;
    CLK : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_osc_axi_system_0_0_async_prescaler : entity is "async_prescaler";
end system_osc_axi_system_0_0_async_prescaler;

architecture STRUCTURE of system_osc_axi_system_0_0_async_prescaler is
  signal cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of cnt : signal is "true";
  signal \cnt[7]_i_3_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute KEEP : string;
  attribute KEEP of \cnt_reg[0]\ : label is "yes";
  attribute KEEP of \cnt_reg[1]\ : label is "yes";
  attribute KEEP of \cnt_reg[2]\ : label is "yes";
  attribute KEEP of \cnt_reg[3]\ : label is "yes";
  attribute KEEP of \cnt_reg[4]\ : label is "yes";
  attribute KEEP of \cnt_reg[5]\ : label is "yes";
  attribute KEEP of \cnt_reg[6]\ : label is "yes";
  attribute KEEP of \cnt_reg[7]\ : label is "yes";
begin
  led_osc <= cnt(7);
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(0),
      O => p_0_in(0)
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(1),
      O => p_0_in(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(1),
      I2 => cnt(2),
      O => p_0_in(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => cnt(1),
      I1 => cnt(0),
      I2 => cnt(2),
      I3 => cnt(3),
      O => p_0_in(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => cnt(2),
      I1 => cnt(0),
      I2 => cnt(1),
      I3 => cnt(3),
      I4 => cnt(4),
      O => p_0_in(4)
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => cnt(3),
      I1 => cnt(1),
      I2 => cnt(0),
      I3 => cnt(2),
      I4 => cnt(4),
      I5 => cnt(5),
      O => p_0_in(5)
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cnt[7]_i_3_n_0\,
      I1 => cnt(6),
      O => p_0_in(6)
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \cnt[7]_i_3_n_0\,
      I1 => cnt(6),
      I2 => cnt(7),
      O => p_0_in(7)
    );
\cnt[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => cnt(5),
      I1 => cnt(3),
      I2 => cnt(1),
      I3 => cnt(0),
      I4 => cnt(2),
      I5 => cnt(4),
      O => \cnt[7]_i_3_n_0\
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(0),
      Q => cnt(0)
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(1),
      Q => cnt(1)
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(2),
      Q => cnt(2)
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(3),
      Q => cnt(3)
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(4),
      Q => cnt(4)
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(5),
      Q => cnt(5)
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(6),
      Q => cnt(6)
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => SR(0),
      D => p_0_in(7),
      Q => cnt(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0_async_ro_carry is
  port (
    \out\ : out STD_LOGIC;
    \reg_tap_reg[5]\ : out STD_LOGIC;
    in0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_osc_axi_system_0_0_async_ro_carry : entity is "async_ro_carry";
end system_osc_axi_system_0_0_async_ro_carry;

architecture STRUCTURE of system_osc_axi_system_0_0_async_ro_carry is
  signal \gen_carry[0].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[10].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[11].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[12].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[13].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[14].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[15].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[16].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[17].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[18].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[19].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[1].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[20].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[21].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[22].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[23].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[24].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[25].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[26].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[27].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[28].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[29].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[2].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[30].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[31].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[32].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[33].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[34].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[35].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[36].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[37].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[38].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[39].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[3].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[40].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[41].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[42].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[43].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[44].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[45].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[46].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[47].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[48].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[49].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[4].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[50].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[51].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[52].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[53].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[54].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[55].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[56].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[57].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[58].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[59].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[5].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[60].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[61].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[62].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[63].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[6].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[7].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[8].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \gen_carry[9].co_local\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal loop_in : STD_LOGIC;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of loop_in : signal is std.standard.true;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of loop_in : signal is "true";
  signal ring_feedback : STD_LOGIC;
  attribute DONT_TOUCH of ring_feedback : signal is std.standard.true;
  attribute RTL_KEEP of ring_feedback : signal is "true";
  signal selected_tap : STD_LOGIC;
  attribute DONT_TOUCH of selected_tap : signal is std.standard.true;
  attribute RTL_KEEP of selected_tap : signal is "true";
  signal selected_tap_inferred_i_10_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_11_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_12_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_13_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_14_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_15_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_16_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_17_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_18_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_19_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_20_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_21_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_22_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_23_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_24_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_25_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_26_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_27_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_28_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_29_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_2_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_3_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_4_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_5_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_6_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_7_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_8_n_0 : STD_LOGIC;
  signal selected_tap_inferred_i_9_n_0 : STD_LOGIC;
  signal \NLW_gen_carry[0].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[0].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[10].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[10].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[11].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[11].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[12].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[12].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[13].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[13].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[14].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[14].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[15].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[15].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[16].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[16].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[17].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[17].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[18].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[18].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[19].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[19].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[1].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[1].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[20].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[20].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[21].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[21].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[22].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[22].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[23].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[23].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[24].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[24].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[25].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[25].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[26].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[26].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[27].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[27].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[28].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[28].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[29].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[29].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[2].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[2].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[30].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[30].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[31].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[31].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[32].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[32].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[33].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[33].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[34].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[34].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[35].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[35].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[36].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[36].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[37].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[37].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[38].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[38].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[39].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[39].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[3].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[3].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[40].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[40].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[41].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[41].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[42].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[42].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[43].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[43].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[44].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[44].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[45].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[45].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[46].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[46].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[47].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[47].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[48].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[48].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[49].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[49].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[4].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[4].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[50].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[50].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[51].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[51].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[52].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[52].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[53].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[53].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[54].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[54].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[55].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[55].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[56].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[56].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[57].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[57].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[58].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[58].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[59].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[59].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[5].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[5].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[60].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[60].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[61].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[61].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[62].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[62].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[63].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[63].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[6].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[6].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[7].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[7].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[8].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[8].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_carry[9].carry_stage_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gen_carry[9].carry_stage_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \gen_carry[0].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP : string;
  attribute KEEP of \gen_carry[0].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[10].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[10].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[11].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[11].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[12].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[12].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[13].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[13].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[14].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[14].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[15].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[15].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[16].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[16].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[17].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[17].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[18].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[18].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[19].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[19].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[1].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[1].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[20].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[20].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[21].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[21].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[22].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[22].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[23].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[23].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[24].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[24].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[25].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[25].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[26].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[26].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[27].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[27].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[28].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[28].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[29].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[29].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[2].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[2].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[30].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[30].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[31].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[31].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[32].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[32].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[33].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[33].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[34].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[34].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[35].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[35].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[36].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[36].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[37].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[37].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[38].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[38].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[39].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[39].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[3].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[3].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[40].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[40].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[41].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[41].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[42].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[42].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[43].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[43].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[44].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[44].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[45].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[45].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[46].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[46].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[47].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[47].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[48].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[48].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[49].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[49].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[4].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[4].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[50].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[50].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[51].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[51].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[52].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[52].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[53].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[53].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[54].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[54].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[55].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[55].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[56].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[56].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[57].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[57].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[58].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[58].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[59].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[59].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[5].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[5].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[60].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[60].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[61].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[61].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[62].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[62].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[63].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[63].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[6].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[6].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[7].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[7].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[8].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[8].carry_stage\ : label is "true";
  attribute BOX_TYPE of \gen_carry[9].carry_stage\ : label is "PRIMITIVE";
  attribute KEEP of \gen_carry[9].carry_stage\ : label is "true";
  attribute BOX_TYPE of loop_inverter : label is "PRIMITIVE";
  attribute DONT_TOUCH of loop_inverter : label is std.standard.true;
  attribute KEEP of loop_inverter : label is "true";
begin
  loop_in <= in0;
  \out\ <= selected_tap;
  \reg_tap_reg[5]\ <= ring_feedback;
\gen_carry[0].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gen_carry[0].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[0].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => loop_in,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[0].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[10].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[9].co_local\(3),
      CO(3) => \gen_carry[10].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[10].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[10].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[11].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[10].co_local\(3),
      CO(3) => \gen_carry[11].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[11].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[11].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[12].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[11].co_local\(3),
      CO(3) => \gen_carry[12].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[12].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[12].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[13].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[12].co_local\(3),
      CO(3) => \gen_carry[13].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[13].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[13].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[14].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[13].co_local\(3),
      CO(3) => \gen_carry[14].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[14].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[14].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[15].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[14].co_local\(3),
      CO(3) => \gen_carry[15].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[15].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[15].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[16].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[15].co_local\(3),
      CO(3) => \gen_carry[16].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[16].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[16].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[17].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[16].co_local\(3),
      CO(3) => \gen_carry[17].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[17].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[17].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[18].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[17].co_local\(3),
      CO(3) => \gen_carry[18].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[18].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[18].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[19].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[18].co_local\(3),
      CO(3) => \gen_carry[19].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[19].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[19].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[1].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[0].co_local\(3),
      CO(3) => \gen_carry[1].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[1].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[1].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[20].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[19].co_local\(3),
      CO(3) => \gen_carry[20].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[20].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[20].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[21].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[20].co_local\(3),
      CO(3) => \gen_carry[21].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[21].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[21].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[22].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[21].co_local\(3),
      CO(3) => \gen_carry[22].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[22].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[22].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[23].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[22].co_local\(3),
      CO(3) => \gen_carry[23].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[23].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[23].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[24].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[23].co_local\(3),
      CO(3) => \gen_carry[24].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[24].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[24].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[25].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[24].co_local\(3),
      CO(3) => \gen_carry[25].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[25].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[25].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[26].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[25].co_local\(3),
      CO(3) => \gen_carry[26].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[26].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[26].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[27].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[26].co_local\(3),
      CO(3) => \gen_carry[27].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[27].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[27].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[28].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[27].co_local\(3),
      CO(3) => \gen_carry[28].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[28].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[28].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[29].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[28].co_local\(3),
      CO(3) => \gen_carry[29].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[29].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[29].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[2].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[1].co_local\(3),
      CO(3) => \gen_carry[2].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[2].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[2].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[30].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[29].co_local\(3),
      CO(3) => \gen_carry[30].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[30].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[30].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[31].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[30].co_local\(3),
      CO(3) => \gen_carry[31].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[31].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[31].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[32].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[31].co_local\(3),
      CO(3) => \gen_carry[32].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[32].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[32].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[33].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[32].co_local\(3),
      CO(3) => \gen_carry[33].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[33].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[33].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[34].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[33].co_local\(3),
      CO(3) => \gen_carry[34].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[34].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[34].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[35].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[34].co_local\(3),
      CO(3) => \gen_carry[35].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[35].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[35].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[36].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[35].co_local\(3),
      CO(3) => \gen_carry[36].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[36].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[36].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[37].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[36].co_local\(3),
      CO(3) => \gen_carry[37].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[37].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[37].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[38].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[37].co_local\(3),
      CO(3) => \gen_carry[38].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[38].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[38].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[39].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[38].co_local\(3),
      CO(3) => \gen_carry[39].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[39].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[39].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[3].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[2].co_local\(3),
      CO(3) => \gen_carry[3].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[3].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[3].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[40].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[39].co_local\(3),
      CO(3) => \gen_carry[40].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[40].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[40].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[41].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[40].co_local\(3),
      CO(3) => \gen_carry[41].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[41].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[41].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[42].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[41].co_local\(3),
      CO(3) => \gen_carry[42].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[42].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[42].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[43].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[42].co_local\(3),
      CO(3) => \gen_carry[43].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[43].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[43].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[44].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[43].co_local\(3),
      CO(3) => \gen_carry[44].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[44].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[44].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[45].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[44].co_local\(3),
      CO(3) => \gen_carry[45].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[45].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[45].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[46].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[45].co_local\(3),
      CO(3) => \gen_carry[46].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[46].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[46].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[47].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[46].co_local\(3),
      CO(3) => \gen_carry[47].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[47].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[47].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[48].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[47].co_local\(3),
      CO(3) => \gen_carry[48].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[48].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[48].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[49].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[48].co_local\(3),
      CO(3) => \gen_carry[49].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[49].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[49].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[4].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[3].co_local\(3),
      CO(3) => \gen_carry[4].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[4].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[4].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[50].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[49].co_local\(3),
      CO(3) => \gen_carry[50].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[50].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[50].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[51].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[50].co_local\(3),
      CO(3) => \gen_carry[51].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[51].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[51].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[52].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[51].co_local\(3),
      CO(3) => \gen_carry[52].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[52].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[52].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[53].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[52].co_local\(3),
      CO(3) => \gen_carry[53].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[53].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[53].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[54].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[53].co_local\(3),
      CO(3) => \gen_carry[54].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[54].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[54].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[55].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[54].co_local\(3),
      CO(3) => \gen_carry[55].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[55].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[55].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[56].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[55].co_local\(3),
      CO(3) => \gen_carry[56].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[56].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[56].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[57].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[56].co_local\(3),
      CO(3) => \gen_carry[57].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[57].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[57].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[58].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[57].co_local\(3),
      CO(3) => \gen_carry[58].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[58].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[58].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[59].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[58].co_local\(3),
      CO(3) => \gen_carry[59].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[59].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[59].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[5].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[4].co_local\(3),
      CO(3) => \gen_carry[5].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[5].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[5].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[60].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[59].co_local\(3),
      CO(3) => \gen_carry[60].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[60].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[60].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[61].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[60].co_local\(3),
      CO(3) => \gen_carry[61].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[61].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[61].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[62].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[61].co_local\(3),
      CO(3) => \gen_carry[62].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[62].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[62].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[63].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[62].co_local\(3),
      CO(3) => \gen_carry[63].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[63].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[63].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[6].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[5].co_local\(3),
      CO(3) => \gen_carry[6].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[6].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[6].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[7].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[6].co_local\(3),
      CO(3) => \gen_carry[7].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[7].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[7].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[8].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[7].co_local\(3),
      CO(3) => \gen_carry[8].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[8].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[8].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
\gen_carry[9].carry_stage\: unisim.vcomponents.CARRY4
     port map (
      CI => \gen_carry[8].co_local\(3),
      CO(3) => \gen_carry[9].co_local\(3),
      CO(2 downto 0) => \NLW_gen_carry[9].carry_stage_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_gen_carry[9].carry_stage_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"1111"
    );
loop_inverter: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => selected_tap,
      O => ring_feedback
    );
selected_tap_inferred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => selected_tap_inferred_i_2_n_0,
      I1 => selected_tap_inferred_i_3_n_0,
      I2 => Q(5),
      I3 => selected_tap_inferred_i_4_n_0,
      I4 => Q(4),
      I5 => selected_tap_inferred_i_5_n_0,
      O => selected_tap
    );
selected_tap_inferred_i_10: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_22_n_0,
      I1 => selected_tap_inferred_i_23_n_0,
      O => selected_tap_inferred_i_10_n_0,
      S => Q(2)
    );
selected_tap_inferred_i_11: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_24_n_0,
      I1 => selected_tap_inferred_i_25_n_0,
      O => selected_tap_inferred_i_11_n_0,
      S => Q(2)
    );
selected_tap_inferred_i_12: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_26_n_0,
      I1 => selected_tap_inferred_i_27_n_0,
      O => selected_tap_inferred_i_12_n_0,
      S => Q(2)
    );
selected_tap_inferred_i_13: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_28_n_0,
      I1 => selected_tap_inferred_i_29_n_0,
      O => selected_tap_inferred_i_13_n_0,
      S => Q(2)
    );
selected_tap_inferred_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[51].co_local\(3),
      I1 => \gen_carry[50].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[49].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[48].co_local\(3),
      O => selected_tap_inferred_i_14_n_0
    );
selected_tap_inferred_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[55].co_local\(3),
      I1 => \gen_carry[54].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[53].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[52].co_local\(3),
      O => selected_tap_inferred_i_15_n_0
    );
selected_tap_inferred_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[59].co_local\(3),
      I1 => \gen_carry[58].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[57].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[56].co_local\(3),
      O => selected_tap_inferred_i_16_n_0
    );
selected_tap_inferred_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[63].co_local\(3),
      I1 => \gen_carry[62].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[61].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[60].co_local\(3),
      O => selected_tap_inferred_i_17_n_0
    );
selected_tap_inferred_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[35].co_local\(3),
      I1 => \gen_carry[34].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[33].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[32].co_local\(3),
      O => selected_tap_inferred_i_18_n_0
    );
selected_tap_inferred_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[39].co_local\(3),
      I1 => \gen_carry[38].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[37].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[36].co_local\(3),
      O => selected_tap_inferred_i_19_n_0
    );
selected_tap_inferred_i_2: unisim.vcomponents.MUXF8
     port map (
      I0 => selected_tap_inferred_i_6_n_0,
      I1 => selected_tap_inferred_i_7_n_0,
      O => selected_tap_inferred_i_2_n_0,
      S => Q(3)
    );
selected_tap_inferred_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[43].co_local\(3),
      I1 => \gen_carry[42].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[41].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[40].co_local\(3),
      O => selected_tap_inferred_i_20_n_0
    );
selected_tap_inferred_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[47].co_local\(3),
      I1 => \gen_carry[46].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[45].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[44].co_local\(3),
      O => selected_tap_inferred_i_21_n_0
    );
selected_tap_inferred_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[19].co_local\(3),
      I1 => \gen_carry[18].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[17].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[16].co_local\(3),
      O => selected_tap_inferred_i_22_n_0
    );
selected_tap_inferred_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[23].co_local\(3),
      I1 => \gen_carry[22].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[21].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[20].co_local\(3),
      O => selected_tap_inferred_i_23_n_0
    );
selected_tap_inferred_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[27].co_local\(3),
      I1 => \gen_carry[26].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[25].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[24].co_local\(3),
      O => selected_tap_inferred_i_24_n_0
    );
selected_tap_inferred_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[31].co_local\(3),
      I1 => \gen_carry[30].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[29].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[28].co_local\(3),
      O => selected_tap_inferred_i_25_n_0
    );
selected_tap_inferred_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[3].co_local\(3),
      I1 => \gen_carry[2].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[1].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[0].co_local\(3),
      O => selected_tap_inferred_i_26_n_0
    );
selected_tap_inferred_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[7].co_local\(3),
      I1 => \gen_carry[6].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[5].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[4].co_local\(3),
      O => selected_tap_inferred_i_27_n_0
    );
selected_tap_inferred_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[11].co_local\(3),
      I1 => \gen_carry[10].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[9].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[8].co_local\(3),
      O => selected_tap_inferred_i_28_n_0
    );
selected_tap_inferred_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \gen_carry[15].co_local\(3),
      I1 => \gen_carry[14].co_local\(3),
      I2 => Q(1),
      I3 => \gen_carry[13].co_local\(3),
      I4 => Q(0),
      I5 => \gen_carry[12].co_local\(3),
      O => selected_tap_inferred_i_29_n_0
    );
selected_tap_inferred_i_3: unisim.vcomponents.MUXF8
     port map (
      I0 => selected_tap_inferred_i_8_n_0,
      I1 => selected_tap_inferred_i_9_n_0,
      O => selected_tap_inferred_i_3_n_0,
      S => Q(3)
    );
selected_tap_inferred_i_4: unisim.vcomponents.MUXF8
     port map (
      I0 => selected_tap_inferred_i_10_n_0,
      I1 => selected_tap_inferred_i_11_n_0,
      O => selected_tap_inferred_i_4_n_0,
      S => Q(3)
    );
selected_tap_inferred_i_5: unisim.vcomponents.MUXF8
     port map (
      I0 => selected_tap_inferred_i_12_n_0,
      I1 => selected_tap_inferred_i_13_n_0,
      O => selected_tap_inferred_i_5_n_0,
      S => Q(3)
    );
selected_tap_inferred_i_6: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_14_n_0,
      I1 => selected_tap_inferred_i_15_n_0,
      O => selected_tap_inferred_i_6_n_0,
      S => Q(2)
    );
selected_tap_inferred_i_7: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_16_n_0,
      I1 => selected_tap_inferred_i_17_n_0,
      O => selected_tap_inferred_i_7_n_0,
      S => Q(2)
    );
selected_tap_inferred_i_8: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_18_n_0,
      I1 => selected_tap_inferred_i_19_n_0,
      O => selected_tap_inferred_i_8_n_0,
      S => Q(2)
    );
selected_tap_inferred_i_9: unisim.vcomponents.MUXF7
     port map (
      I0 => selected_tap_inferred_i_20_n_0,
      I1 => selected_tap_inferred_i_21_n_0,
      O => selected_tap_inferred_i_9_n_0,
      S => Q(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0_async_ro_lut is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_inv[13].inv_stage_0\ : out STD_LOGIC;
    \gen_inv[1].inv_stage_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_osc_axi_system_0_0_async_ro_lut : entity is "async_ro_lut";
end system_osc_axi_system_0_0_async_ro_lut;

architecture STRUCTURE of system_osc_axi_system_0_0_async_ro_lut is
  signal chain : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of chain : signal is std.standard.true;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of chain : signal is "true";
  signal loop_in : STD_LOGIC;
  attribute DONT_TOUCH of loop_in : signal is std.standard.true;
  attribute RTL_KEEP of loop_in : signal is "true";
  signal ring_feedback : STD_LOGIC;
  attribute DONT_TOUCH of ring_feedback : signal is std.standard.true;
  attribute RTL_KEEP of ring_feedback : signal is "true";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \gen_inv[0].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[0].inv_stage\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \gen_inv[0].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[10].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[10].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[10].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[11].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[11].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[11].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[12].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[12].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[12].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[13].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[13].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[13].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[14].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[14].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[14].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[1].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[1].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[1].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[2].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[2].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[2].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[3].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[3].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[3].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[4].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[4].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[4].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[5].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[5].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[5].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[6].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[6].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[6].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[7].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[7].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[7].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[8].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[8].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[8].inv_stage\ : label is "true";
  attribute BOX_TYPE of \gen_inv[9].inv_stage\ : label is "PRIMITIVE";
  attribute DONT_TOUCH of \gen_inv[9].inv_stage\ : label is std.standard.true;
  attribute KEEP of \gen_inv[9].inv_stage\ : label is "true";
begin
  \gen_inv[13].inv_stage_0\ <= ring_feedback;
  loop_in <= \gen_inv[1].inv_stage_0\;
  \out\(0) <= chain(15);
\gen_inv[0].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(0),
      O => chain(1)
    );
\gen_inv[10].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(10),
      O => chain(11)
    );
\gen_inv[11].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(11),
      O => chain(12)
    );
\gen_inv[12].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(12),
      O => chain(13)
    );
\gen_inv[13].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(13),
      O => chain(14)
    );
\gen_inv[14].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(14),
      O => chain(15)
    );
\gen_inv[1].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(1),
      O => chain(2)
    );
\gen_inv[2].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(2),
      O => chain(3)
    );
\gen_inv[3].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(3),
      O => chain(4)
    );
\gen_inv[4].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(4),
      O => chain(5)
    );
\gen_inv[5].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(5),
      O => chain(6)
    );
\gen_inv[6].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(6),
      O => chain(7)
    );
\gen_inv[7].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(7),
      O => chain(8)
    );
\gen_inv[8].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(8),
      O => chain(9)
    );
\gen_inv[9].inv_stage\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => chain(9),
      O => chain(10)
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => chain(15),
      O => ring_feedback
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => loop_in,
      O => chain(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0_freq_counter is
  port (
    s00_axi_aresetn_0 : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_reg_0 : out STD_LOGIC;
    led_osc : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \s00_axi_rdata[31]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    valid_sticky : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    valid_sticky_reg : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_osc_axi_system_0_0_freq_counter : entity is "freq_counter";
end system_osc_axi_system_0_0_freq_counter;

architecture STRUCTURE of system_osc_axi_system_0_0_freq_counter is
  signal \edge_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \edge_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \edge_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \edge_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \edge_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \edge_cnt[16]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt[16]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[16]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[16]_i_5_n_0\ : STD_LOGIC;
  signal \edge_cnt[20]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt[20]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[20]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[20]_i_5_n_0\ : STD_LOGIC;
  signal \edge_cnt[24]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt[24]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[24]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[24]_i_5_n_0\ : STD_LOGIC;
  signal \edge_cnt[28]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt[28]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[28]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[28]_i_5_n_0\ : STD_LOGIC;
  signal \edge_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \edge_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \edge_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \edge_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal edge_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \edge_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \edge_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \edge_cnt_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \edge_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal freq_count : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal freq_valid : STD_LOGIC;
  signal \^s00_axi_aresetn_0\ : STD_LOGIC;
  signal sync_ff1 : STD_LOGIC;
  signal sync_ff2 : STD_LOGIC;
  signal sync_ff3 : STD_LOGIC;
  signal valid_i_2_n_0 : STD_LOGIC;
  signal valid_i_3_n_0 : STD_LOGIC;
  signal valid_i_4_n_0 : STD_LOGIC;
  signal \window_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal \window_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \window_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \window_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \window_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \window_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \window_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \window_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \window_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \window_cnt[16]_i_2_n_0\ : STD_LOGIC;
  signal \window_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \window_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \window_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \window_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \window_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \window_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \window_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \window_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal window_cnt_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \window_cnt_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \window_cnt_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \window_cnt_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \window_cnt_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \window_cnt_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \window_cnt_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \window_cnt_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \window_cnt_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \window_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \window_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \window_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \window_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal window_done : STD_LOGIC;
  signal \NLW_edge_cnt_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_window_cnt_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_window_cnt_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
begin
  s00_axi_aresetn_0 <= \^s00_axi_aresetn_0\;
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^s00_axi_aresetn_0\
    );
\edge_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => window_done,
      I1 => sync_ff3,
      I2 => sync_ff2,
      O => \edge_cnt[0]_i_1_n_0\
    );
\edge_cnt[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(0),
      I1 => window_done,
      O => \edge_cnt[0]_i_3_n_0\
    );
\edge_cnt[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(3),
      I1 => window_done,
      O => \edge_cnt[0]_i_4_n_0\
    );
\edge_cnt[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(2),
      I1 => window_done,
      O => \edge_cnt[0]_i_5_n_0\
    );
\edge_cnt[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(1),
      I1 => window_done,
      O => \edge_cnt[0]_i_6_n_0\
    );
\edge_cnt[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => edge_cnt_reg(0),
      I1 => window_done,
      O => \edge_cnt[0]_i_7_n_0\
    );
\edge_cnt[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(15),
      I1 => window_done,
      O => \edge_cnt[12]_i_2_n_0\
    );
\edge_cnt[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(14),
      I1 => window_done,
      O => \edge_cnt[12]_i_3_n_0\
    );
\edge_cnt[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(13),
      I1 => window_done,
      O => \edge_cnt[12]_i_4_n_0\
    );
\edge_cnt[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(12),
      I1 => window_done,
      O => \edge_cnt[12]_i_5_n_0\
    );
\edge_cnt[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(19),
      I1 => window_done,
      O => \edge_cnt[16]_i_2_n_0\
    );
\edge_cnt[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(18),
      I1 => window_done,
      O => \edge_cnt[16]_i_3_n_0\
    );
\edge_cnt[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(17),
      I1 => window_done,
      O => \edge_cnt[16]_i_4_n_0\
    );
\edge_cnt[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(16),
      I1 => window_done,
      O => \edge_cnt[16]_i_5_n_0\
    );
\edge_cnt[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(23),
      I1 => window_done,
      O => \edge_cnt[20]_i_2_n_0\
    );
\edge_cnt[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(22),
      I1 => window_done,
      O => \edge_cnt[20]_i_3_n_0\
    );
\edge_cnt[20]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(21),
      I1 => window_done,
      O => \edge_cnt[20]_i_4_n_0\
    );
\edge_cnt[20]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(20),
      I1 => window_done,
      O => \edge_cnt[20]_i_5_n_0\
    );
\edge_cnt[24]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(27),
      I1 => window_done,
      O => \edge_cnt[24]_i_2_n_0\
    );
\edge_cnt[24]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(26),
      I1 => window_done,
      O => \edge_cnt[24]_i_3_n_0\
    );
\edge_cnt[24]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(25),
      I1 => window_done,
      O => \edge_cnt[24]_i_4_n_0\
    );
\edge_cnt[24]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(24),
      I1 => window_done,
      O => \edge_cnt[24]_i_5_n_0\
    );
\edge_cnt[28]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(31),
      I1 => window_done,
      O => \edge_cnt[28]_i_2_n_0\
    );
\edge_cnt[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(30),
      I1 => window_done,
      O => \edge_cnt[28]_i_3_n_0\
    );
\edge_cnt[28]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(29),
      I1 => window_done,
      O => \edge_cnt[28]_i_4_n_0\
    );
\edge_cnt[28]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(28),
      I1 => window_done,
      O => \edge_cnt[28]_i_5_n_0\
    );
\edge_cnt[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(7),
      I1 => window_done,
      O => \edge_cnt[4]_i_2_n_0\
    );
\edge_cnt[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(6),
      I1 => window_done,
      O => \edge_cnt[4]_i_3_n_0\
    );
\edge_cnt[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(5),
      I1 => window_done,
      O => \edge_cnt[4]_i_4_n_0\
    );
\edge_cnt[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(4),
      I1 => window_done,
      O => \edge_cnt[4]_i_5_n_0\
    );
\edge_cnt[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(11),
      I1 => window_done,
      O => \edge_cnt[8]_i_2_n_0\
    );
\edge_cnt[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(10),
      I1 => window_done,
      O => \edge_cnt[8]_i_3_n_0\
    );
\edge_cnt[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(9),
      I1 => window_done,
      O => \edge_cnt[8]_i_4_n_0\
    );
\edge_cnt[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => edge_cnt_reg(8),
      I1 => window_done,
      O => \edge_cnt[8]_i_5_n_0\
    );
\edge_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[0]_i_2_n_7\,
      Q => edge_cnt_reg(0)
    );
\edge_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \edge_cnt_reg[0]_i_2_n_0\,
      CO(2) => \edge_cnt_reg[0]_i_2_n_1\,
      CO(1) => \edge_cnt_reg[0]_i_2_n_2\,
      CO(0) => \edge_cnt_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \edge_cnt[0]_i_3_n_0\,
      O(3) => \edge_cnt_reg[0]_i_2_n_4\,
      O(2) => \edge_cnt_reg[0]_i_2_n_5\,
      O(1) => \edge_cnt_reg[0]_i_2_n_6\,
      O(0) => \edge_cnt_reg[0]_i_2_n_7\,
      S(3) => \edge_cnt[0]_i_4_n_0\,
      S(2) => \edge_cnt[0]_i_5_n_0\,
      S(1) => \edge_cnt[0]_i_6_n_0\,
      S(0) => \edge_cnt[0]_i_7_n_0\
    );
\edge_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[8]_i_1_n_5\,
      Q => edge_cnt_reg(10)
    );
\edge_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[8]_i_1_n_4\,
      Q => edge_cnt_reg(11)
    );
\edge_cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[12]_i_1_n_7\,
      Q => edge_cnt_reg(12)
    );
\edge_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \edge_cnt_reg[8]_i_1_n_0\,
      CO(3) => \edge_cnt_reg[12]_i_1_n_0\,
      CO(2) => \edge_cnt_reg[12]_i_1_n_1\,
      CO(1) => \edge_cnt_reg[12]_i_1_n_2\,
      CO(0) => \edge_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \edge_cnt_reg[12]_i_1_n_4\,
      O(2) => \edge_cnt_reg[12]_i_1_n_5\,
      O(1) => \edge_cnt_reg[12]_i_1_n_6\,
      O(0) => \edge_cnt_reg[12]_i_1_n_7\,
      S(3) => \edge_cnt[12]_i_2_n_0\,
      S(2) => \edge_cnt[12]_i_3_n_0\,
      S(1) => \edge_cnt[12]_i_4_n_0\,
      S(0) => \edge_cnt[12]_i_5_n_0\
    );
\edge_cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[12]_i_1_n_6\,
      Q => edge_cnt_reg(13)
    );
\edge_cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[12]_i_1_n_5\,
      Q => edge_cnt_reg(14)
    );
\edge_cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[12]_i_1_n_4\,
      Q => edge_cnt_reg(15)
    );
\edge_cnt_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[16]_i_1_n_7\,
      Q => edge_cnt_reg(16)
    );
\edge_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \edge_cnt_reg[12]_i_1_n_0\,
      CO(3) => \edge_cnt_reg[16]_i_1_n_0\,
      CO(2) => \edge_cnt_reg[16]_i_1_n_1\,
      CO(1) => \edge_cnt_reg[16]_i_1_n_2\,
      CO(0) => \edge_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \edge_cnt_reg[16]_i_1_n_4\,
      O(2) => \edge_cnt_reg[16]_i_1_n_5\,
      O(1) => \edge_cnt_reg[16]_i_1_n_6\,
      O(0) => \edge_cnt_reg[16]_i_1_n_7\,
      S(3) => \edge_cnt[16]_i_2_n_0\,
      S(2) => \edge_cnt[16]_i_3_n_0\,
      S(1) => \edge_cnt[16]_i_4_n_0\,
      S(0) => \edge_cnt[16]_i_5_n_0\
    );
\edge_cnt_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[16]_i_1_n_6\,
      Q => edge_cnt_reg(17)
    );
\edge_cnt_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[16]_i_1_n_5\,
      Q => edge_cnt_reg(18)
    );
\edge_cnt_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[16]_i_1_n_4\,
      Q => edge_cnt_reg(19)
    );
\edge_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[0]_i_2_n_6\,
      Q => edge_cnt_reg(1)
    );
\edge_cnt_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[20]_i_1_n_7\,
      Q => edge_cnt_reg(20)
    );
\edge_cnt_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \edge_cnt_reg[16]_i_1_n_0\,
      CO(3) => \edge_cnt_reg[20]_i_1_n_0\,
      CO(2) => \edge_cnt_reg[20]_i_1_n_1\,
      CO(1) => \edge_cnt_reg[20]_i_1_n_2\,
      CO(0) => \edge_cnt_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \edge_cnt_reg[20]_i_1_n_4\,
      O(2) => \edge_cnt_reg[20]_i_1_n_5\,
      O(1) => \edge_cnt_reg[20]_i_1_n_6\,
      O(0) => \edge_cnt_reg[20]_i_1_n_7\,
      S(3) => \edge_cnt[20]_i_2_n_0\,
      S(2) => \edge_cnt[20]_i_3_n_0\,
      S(1) => \edge_cnt[20]_i_4_n_0\,
      S(0) => \edge_cnt[20]_i_5_n_0\
    );
\edge_cnt_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[20]_i_1_n_6\,
      Q => edge_cnt_reg(21)
    );
\edge_cnt_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[20]_i_1_n_5\,
      Q => edge_cnt_reg(22)
    );
\edge_cnt_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[20]_i_1_n_4\,
      Q => edge_cnt_reg(23)
    );
\edge_cnt_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[24]_i_1_n_7\,
      Q => edge_cnt_reg(24)
    );
\edge_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \edge_cnt_reg[20]_i_1_n_0\,
      CO(3) => \edge_cnt_reg[24]_i_1_n_0\,
      CO(2) => \edge_cnt_reg[24]_i_1_n_1\,
      CO(1) => \edge_cnt_reg[24]_i_1_n_2\,
      CO(0) => \edge_cnt_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \edge_cnt_reg[24]_i_1_n_4\,
      O(2) => \edge_cnt_reg[24]_i_1_n_5\,
      O(1) => \edge_cnt_reg[24]_i_1_n_6\,
      O(0) => \edge_cnt_reg[24]_i_1_n_7\,
      S(3) => \edge_cnt[24]_i_2_n_0\,
      S(2) => \edge_cnt[24]_i_3_n_0\,
      S(1) => \edge_cnt[24]_i_4_n_0\,
      S(0) => \edge_cnt[24]_i_5_n_0\
    );
\edge_cnt_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[24]_i_1_n_6\,
      Q => edge_cnt_reg(25)
    );
\edge_cnt_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[24]_i_1_n_5\,
      Q => edge_cnt_reg(26)
    );
\edge_cnt_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[24]_i_1_n_4\,
      Q => edge_cnt_reg(27)
    );
\edge_cnt_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[28]_i_1_n_7\,
      Q => edge_cnt_reg(28)
    );
\edge_cnt_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \edge_cnt_reg[24]_i_1_n_0\,
      CO(3) => \NLW_edge_cnt_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \edge_cnt_reg[28]_i_1_n_1\,
      CO(1) => \edge_cnt_reg[28]_i_1_n_2\,
      CO(0) => \edge_cnt_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \edge_cnt_reg[28]_i_1_n_4\,
      O(2) => \edge_cnt_reg[28]_i_1_n_5\,
      O(1) => \edge_cnt_reg[28]_i_1_n_6\,
      O(0) => \edge_cnt_reg[28]_i_1_n_7\,
      S(3) => \edge_cnt[28]_i_2_n_0\,
      S(2) => \edge_cnt[28]_i_3_n_0\,
      S(1) => \edge_cnt[28]_i_4_n_0\,
      S(0) => \edge_cnt[28]_i_5_n_0\
    );
\edge_cnt_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[28]_i_1_n_6\,
      Q => edge_cnt_reg(29)
    );
\edge_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[0]_i_2_n_5\,
      Q => edge_cnt_reg(2)
    );
\edge_cnt_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[28]_i_1_n_5\,
      Q => edge_cnt_reg(30)
    );
\edge_cnt_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[28]_i_1_n_4\,
      Q => edge_cnt_reg(31)
    );
\edge_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[0]_i_2_n_4\,
      Q => edge_cnt_reg(3)
    );
\edge_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[4]_i_1_n_7\,
      Q => edge_cnt_reg(4)
    );
\edge_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \edge_cnt_reg[0]_i_2_n_0\,
      CO(3) => \edge_cnt_reg[4]_i_1_n_0\,
      CO(2) => \edge_cnt_reg[4]_i_1_n_1\,
      CO(1) => \edge_cnt_reg[4]_i_1_n_2\,
      CO(0) => \edge_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \edge_cnt_reg[4]_i_1_n_4\,
      O(2) => \edge_cnt_reg[4]_i_1_n_5\,
      O(1) => \edge_cnt_reg[4]_i_1_n_6\,
      O(0) => \edge_cnt_reg[4]_i_1_n_7\,
      S(3) => \edge_cnt[4]_i_2_n_0\,
      S(2) => \edge_cnt[4]_i_3_n_0\,
      S(1) => \edge_cnt[4]_i_4_n_0\,
      S(0) => \edge_cnt[4]_i_5_n_0\
    );
\edge_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[4]_i_1_n_6\,
      Q => edge_cnt_reg(5)
    );
\edge_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[4]_i_1_n_5\,
      Q => edge_cnt_reg(6)
    );
\edge_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[4]_i_1_n_4\,
      Q => edge_cnt_reg(7)
    );
\edge_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[8]_i_1_n_7\,
      Q => edge_cnt_reg(8)
    );
\edge_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \edge_cnt_reg[4]_i_1_n_0\,
      CO(3) => \edge_cnt_reg[8]_i_1_n_0\,
      CO(2) => \edge_cnt_reg[8]_i_1_n_1\,
      CO(1) => \edge_cnt_reg[8]_i_1_n_2\,
      CO(0) => \edge_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \edge_cnt_reg[8]_i_1_n_4\,
      O(2) => \edge_cnt_reg[8]_i_1_n_5\,
      O(1) => \edge_cnt_reg[8]_i_1_n_6\,
      O(0) => \edge_cnt_reg[8]_i_1_n_7\,
      S(3) => \edge_cnt[8]_i_2_n_0\,
      S(2) => \edge_cnt[8]_i_3_n_0\,
      S(1) => \edge_cnt[8]_i_4_n_0\,
      S(0) => \edge_cnt[8]_i_5_n_0\
    );
\edge_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => \edge_cnt[0]_i_1_n_0\,
      CLR => \^s00_axi_aresetn_0\,
      D => \edge_cnt_reg[8]_i_1_n_6\,
      Q => edge_cnt_reg(9)
    );
\freq_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(0),
      Q => freq_count(0)
    );
\freq_count_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(10),
      Q => freq_count(10)
    );
\freq_count_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(11),
      Q => freq_count(11)
    );
\freq_count_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(12),
      Q => freq_count(12)
    );
\freq_count_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(13),
      Q => freq_count(13)
    );
\freq_count_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(14),
      Q => freq_count(14)
    );
\freq_count_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(15),
      Q => freq_count(15)
    );
\freq_count_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(16),
      Q => freq_count(16)
    );
\freq_count_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(17),
      Q => freq_count(17)
    );
\freq_count_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(18),
      Q => freq_count(18)
    );
\freq_count_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(19),
      Q => freq_count(19)
    );
\freq_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(1),
      Q => freq_count(1)
    );
\freq_count_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(20),
      Q => freq_count(20)
    );
\freq_count_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(21),
      Q => freq_count(21)
    );
\freq_count_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(22),
      Q => freq_count(22)
    );
\freq_count_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(23),
      Q => freq_count(23)
    );
\freq_count_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(24),
      Q => freq_count(24)
    );
\freq_count_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(25),
      Q => freq_count(25)
    );
\freq_count_reg[26]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(26),
      Q => freq_count(26)
    );
\freq_count_reg[27]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(27),
      Q => freq_count(27)
    );
\freq_count_reg[28]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(28),
      Q => freq_count(28)
    );
\freq_count_reg[29]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(29),
      Q => freq_count(29)
    );
\freq_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(2),
      Q => freq_count(2)
    );
\freq_count_reg[30]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(30),
      Q => freq_count(30)
    );
\freq_count_reg[31]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(31),
      Q => freq_count(31)
    );
\freq_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(3),
      Q => freq_count(3)
    );
\freq_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(4),
      Q => freq_count(4)
    );
\freq_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(5),
      Q => freq_count(5)
    );
\freq_count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(6),
      Q => freq_count(6)
    );
\freq_count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(7),
      Q => freq_count(7)
    );
\freq_count_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(8),
      Q => freq_count(8)
    );
\freq_count_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => window_done,
      CLR => \^s00_axi_aresetn_0\,
      D => edge_cnt_reg(9),
      Q => freq_count(9)
    );
\s00_axi_rdata[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Q(0),
      I1 => \s00_axi_rdata[31]\(0),
      I2 => axi_araddr(0),
      I3 => valid_sticky,
      I4 => axi_araddr(1),
      I5 => freq_count(0),
      O => s00_axi_rdata(0)
    );
\s00_axi_rdata[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(10),
      I1 => \s00_axi_rdata[31]\(10),
      I2 => axi_araddr(0),
      I3 => freq_count(10),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(10)
    );
\s00_axi_rdata[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(11),
      I1 => \s00_axi_rdata[31]\(11),
      I2 => axi_araddr(0),
      I3 => freq_count(11),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(11)
    );
\s00_axi_rdata[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(12),
      I1 => \s00_axi_rdata[31]\(12),
      I2 => axi_araddr(0),
      I3 => freq_count(12),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(12)
    );
\s00_axi_rdata[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(13),
      I1 => \s00_axi_rdata[31]\(13),
      I2 => axi_araddr(0),
      I3 => freq_count(13),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(13)
    );
\s00_axi_rdata[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(14),
      I1 => \s00_axi_rdata[31]\(14),
      I2 => axi_araddr(0),
      I3 => freq_count(14),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(14)
    );
\s00_axi_rdata[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(15),
      I1 => \s00_axi_rdata[31]\(15),
      I2 => axi_araddr(0),
      I3 => freq_count(15),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(15)
    );
\s00_axi_rdata[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(16),
      I1 => \s00_axi_rdata[31]\(16),
      I2 => axi_araddr(0),
      I3 => freq_count(16),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(16)
    );
\s00_axi_rdata[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(17),
      I1 => \s00_axi_rdata[31]\(17),
      I2 => axi_araddr(0),
      I3 => freq_count(17),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(17)
    );
\s00_axi_rdata[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(18),
      I1 => \s00_axi_rdata[31]\(18),
      I2 => axi_araddr(0),
      I3 => freq_count(18),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(18)
    );
\s00_axi_rdata[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(19),
      I1 => \s00_axi_rdata[31]\(19),
      I2 => axi_araddr(0),
      I3 => freq_count(19),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(19)
    );
\s00_axi_rdata[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(1),
      I1 => \s00_axi_rdata[31]\(1),
      I2 => axi_araddr(0),
      I3 => freq_count(1),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(1)
    );
\s00_axi_rdata[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(20),
      I1 => \s00_axi_rdata[31]\(20),
      I2 => axi_araddr(0),
      I3 => freq_count(20),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(20)
    );
\s00_axi_rdata[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(21),
      I1 => \s00_axi_rdata[31]\(21),
      I2 => axi_araddr(0),
      I3 => freq_count(21),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(21)
    );
\s00_axi_rdata[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(22),
      I1 => \s00_axi_rdata[31]\(22),
      I2 => axi_araddr(0),
      I3 => freq_count(22),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(22)
    );
\s00_axi_rdata[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(23),
      I1 => \s00_axi_rdata[31]\(23),
      I2 => axi_araddr(0),
      I3 => freq_count(23),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(23)
    );
\s00_axi_rdata[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(24),
      I1 => \s00_axi_rdata[31]\(24),
      I2 => axi_araddr(0),
      I3 => freq_count(24),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(24)
    );
\s00_axi_rdata[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(25),
      I1 => \s00_axi_rdata[31]\(25),
      I2 => axi_araddr(0),
      I3 => freq_count(25),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(25)
    );
\s00_axi_rdata[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(26),
      I1 => \s00_axi_rdata[31]\(26),
      I2 => axi_araddr(0),
      I3 => freq_count(26),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(26)
    );
\s00_axi_rdata[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(27),
      I1 => \s00_axi_rdata[31]\(27),
      I2 => axi_araddr(0),
      I3 => freq_count(27),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(27)
    );
\s00_axi_rdata[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(28),
      I1 => \s00_axi_rdata[31]\(28),
      I2 => axi_araddr(0),
      I3 => freq_count(28),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(28)
    );
\s00_axi_rdata[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(29),
      I1 => \s00_axi_rdata[31]\(29),
      I2 => axi_araddr(0),
      I3 => freq_count(29),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(29)
    );
\s00_axi_rdata[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(2),
      I1 => \s00_axi_rdata[31]\(2),
      I2 => axi_araddr(0),
      I3 => freq_count(2),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(2)
    );
\s00_axi_rdata[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(30),
      I1 => \s00_axi_rdata[31]\(30),
      I2 => axi_araddr(0),
      I3 => freq_count(30),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(30)
    );
\s00_axi_rdata[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(31),
      I1 => \s00_axi_rdata[31]\(31),
      I2 => axi_araddr(0),
      I3 => freq_count(31),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(31)
    );
\s00_axi_rdata[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(3),
      I1 => \s00_axi_rdata[31]\(3),
      I2 => axi_araddr(0),
      I3 => freq_count(3),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(3)
    );
\s00_axi_rdata[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(4),
      I1 => \s00_axi_rdata[31]\(4),
      I2 => axi_araddr(0),
      I3 => freq_count(4),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(4)
    );
\s00_axi_rdata[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(5),
      I1 => \s00_axi_rdata[31]\(5),
      I2 => axi_araddr(0),
      I3 => freq_count(5),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(5)
    );
\s00_axi_rdata[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(6),
      I1 => \s00_axi_rdata[31]\(6),
      I2 => axi_araddr(0),
      I3 => freq_count(6),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(6)
    );
\s00_axi_rdata[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(7),
      I1 => \s00_axi_rdata[31]\(7),
      I2 => axi_araddr(0),
      I3 => freq_count(7),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(7)
    );
\s00_axi_rdata[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(8),
      I1 => \s00_axi_rdata[31]\(8),
      I2 => axi_araddr(0),
      I3 => freq_count(8),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(8)
    );
\s00_axi_rdata[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => Q(9),
      I1 => \s00_axi_rdata[31]\(9),
      I2 => axi_araddr(0),
      I3 => freq_count(9),
      I4 => axi_araddr(1),
      O => s00_axi_rdata(9)
    );
sync_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => led_osc,
      Q => sync_ff1
    );
sync_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => sync_ff1,
      Q => sync_ff2
    );
sync_ff3_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => sync_ff2,
      Q => sync_ff3
    );
valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => valid_i_2_n_0,
      I1 => window_cnt_reg(14),
      I2 => window_cnt_reg(13),
      I3 => window_cnt_reg(12),
      I4 => window_cnt_reg(11),
      I5 => valid_i_3_n_0,
      O => window_done
    );
valid_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFB"
    )
        port map (
      I0 => window_cnt_reg(5),
      I1 => window_cnt_reg(15),
      I2 => window_cnt_reg(8),
      I3 => window_cnt_reg(6),
      O => valid_i_2_n_0
    );
valid_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => valid_i_4_n_0,
      I1 => window_cnt_reg(10),
      I2 => window_cnt_reg(16),
      I3 => window_cnt_reg(7),
      I4 => window_cnt_reg(9),
      O => valid_i_3_n_0
    );
valid_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => window_cnt_reg(0),
      I1 => window_cnt_reg(1),
      I2 => window_cnt_reg(2),
      I3 => window_cnt_reg(4),
      I4 => window_cnt_reg(3),
      O => valid_i_4_n_0
    );
valid_reg: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => window_done,
      Q => freq_valid
    );
valid_sticky_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFFAAAAAAAA"
    )
        port map (
      I0 => freq_valid,
      I1 => s00_axi_arvalid,
      I2 => valid_sticky_reg,
      I3 => s00_axi_araddr(1),
      I4 => s00_axi_araddr(0),
      I5 => valid_sticky,
      O => valid_reg_0
    );
\window_cnt[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(0),
      I1 => window_done,
      O => \window_cnt[0]_i_2_n_0\
    );
\window_cnt[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(3),
      I1 => window_done,
      O => \window_cnt[0]_i_3_n_0\
    );
\window_cnt[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(2),
      I1 => window_done,
      O => \window_cnt[0]_i_4_n_0\
    );
\window_cnt[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(1),
      I1 => window_done,
      O => \window_cnt[0]_i_5_n_0\
    );
\window_cnt[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => window_cnt_reg(0),
      I1 => window_done,
      O => \window_cnt[0]_i_6_n_0\
    );
\window_cnt[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(15),
      I1 => window_done,
      O => \window_cnt[12]_i_2_n_0\
    );
\window_cnt[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(14),
      I1 => window_done,
      O => \window_cnt[12]_i_3_n_0\
    );
\window_cnt[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(13),
      I1 => window_done,
      O => \window_cnt[12]_i_4_n_0\
    );
\window_cnt[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(12),
      I1 => window_done,
      O => \window_cnt[12]_i_5_n_0\
    );
\window_cnt[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(16),
      I1 => window_done,
      O => \window_cnt[16]_i_2_n_0\
    );
\window_cnt[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(7),
      I1 => window_done,
      O => \window_cnt[4]_i_2_n_0\
    );
\window_cnt[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(6),
      I1 => window_done,
      O => \window_cnt[4]_i_3_n_0\
    );
\window_cnt[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(5),
      I1 => window_done,
      O => \window_cnt[4]_i_4_n_0\
    );
\window_cnt[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(4),
      I1 => window_done,
      O => \window_cnt[4]_i_5_n_0\
    );
\window_cnt[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(11),
      I1 => window_done,
      O => \window_cnt[8]_i_2_n_0\
    );
\window_cnt[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(10),
      I1 => window_done,
      O => \window_cnt[8]_i_3_n_0\
    );
\window_cnt[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(9),
      I1 => window_done,
      O => \window_cnt[8]_i_4_n_0\
    );
\window_cnt[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => window_cnt_reg(8),
      I1 => window_done,
      O => \window_cnt[8]_i_5_n_0\
    );
\window_cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[0]_i_1_n_7\,
      Q => window_cnt_reg(0)
    );
\window_cnt_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \window_cnt_reg[0]_i_1_n_0\,
      CO(2) => \window_cnt_reg[0]_i_1_n_1\,
      CO(1) => \window_cnt_reg[0]_i_1_n_2\,
      CO(0) => \window_cnt_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \window_cnt[0]_i_2_n_0\,
      O(3) => \window_cnt_reg[0]_i_1_n_4\,
      O(2) => \window_cnt_reg[0]_i_1_n_5\,
      O(1) => \window_cnt_reg[0]_i_1_n_6\,
      O(0) => \window_cnt_reg[0]_i_1_n_7\,
      S(3) => \window_cnt[0]_i_3_n_0\,
      S(2) => \window_cnt[0]_i_4_n_0\,
      S(1) => \window_cnt[0]_i_5_n_0\,
      S(0) => \window_cnt[0]_i_6_n_0\
    );
\window_cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[8]_i_1_n_5\,
      Q => window_cnt_reg(10)
    );
\window_cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[8]_i_1_n_4\,
      Q => window_cnt_reg(11)
    );
\window_cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[12]_i_1_n_7\,
      Q => window_cnt_reg(12)
    );
\window_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \window_cnt_reg[8]_i_1_n_0\,
      CO(3) => \window_cnt_reg[12]_i_1_n_0\,
      CO(2) => \window_cnt_reg[12]_i_1_n_1\,
      CO(1) => \window_cnt_reg[12]_i_1_n_2\,
      CO(0) => \window_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \window_cnt_reg[12]_i_1_n_4\,
      O(2) => \window_cnt_reg[12]_i_1_n_5\,
      O(1) => \window_cnt_reg[12]_i_1_n_6\,
      O(0) => \window_cnt_reg[12]_i_1_n_7\,
      S(3) => \window_cnt[12]_i_2_n_0\,
      S(2) => \window_cnt[12]_i_3_n_0\,
      S(1) => \window_cnt[12]_i_4_n_0\,
      S(0) => \window_cnt[12]_i_5_n_0\
    );
\window_cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[12]_i_1_n_6\,
      Q => window_cnt_reg(13)
    );
\window_cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[12]_i_1_n_5\,
      Q => window_cnt_reg(14)
    );
\window_cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[12]_i_1_n_4\,
      Q => window_cnt_reg(15)
    );
\window_cnt_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[16]_i_1_n_7\,
      Q => window_cnt_reg(16)
    );
\window_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \window_cnt_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_window_cnt_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_window_cnt_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \window_cnt_reg[16]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \window_cnt[16]_i_2_n_0\
    );
\window_cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[0]_i_1_n_6\,
      Q => window_cnt_reg(1)
    );
\window_cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[0]_i_1_n_5\,
      Q => window_cnt_reg(2)
    );
\window_cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[0]_i_1_n_4\,
      Q => window_cnt_reg(3)
    );
\window_cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[4]_i_1_n_7\,
      Q => window_cnt_reg(4)
    );
\window_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \window_cnt_reg[0]_i_1_n_0\,
      CO(3) => \window_cnt_reg[4]_i_1_n_0\,
      CO(2) => \window_cnt_reg[4]_i_1_n_1\,
      CO(1) => \window_cnt_reg[4]_i_1_n_2\,
      CO(0) => \window_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \window_cnt_reg[4]_i_1_n_4\,
      O(2) => \window_cnt_reg[4]_i_1_n_5\,
      O(1) => \window_cnt_reg[4]_i_1_n_6\,
      O(0) => \window_cnt_reg[4]_i_1_n_7\,
      S(3) => \window_cnt[4]_i_2_n_0\,
      S(2) => \window_cnt[4]_i_3_n_0\,
      S(1) => \window_cnt[4]_i_4_n_0\,
      S(0) => \window_cnt[4]_i_5_n_0\
    );
\window_cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[4]_i_1_n_6\,
      Q => window_cnt_reg(5)
    );
\window_cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[4]_i_1_n_5\,
      Q => window_cnt_reg(6)
    );
\window_cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[4]_i_1_n_4\,
      Q => window_cnt_reg(7)
    );
\window_cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[8]_i_1_n_7\,
      Q => window_cnt_reg(8)
    );
\window_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \window_cnt_reg[4]_i_1_n_0\,
      CO(3) => \window_cnt_reg[8]_i_1_n_0\,
      CO(2) => \window_cnt_reg[8]_i_1_n_1\,
      CO(1) => \window_cnt_reg[8]_i_1_n_2\,
      CO(0) => \window_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \window_cnt_reg[8]_i_1_n_4\,
      O(2) => \window_cnt_reg[8]_i_1_n_5\,
      O(1) => \window_cnt_reg[8]_i_1_n_6\,
      O(0) => \window_cnt_reg[8]_i_1_n_7\,
      S(3) => \window_cnt[8]_i_2_n_0\,
      S(2) => \window_cnt[8]_i_3_n_0\,
      S(1) => \window_cnt[8]_i_4_n_0\,
      S(0) => \window_cnt[8]_i_5_n_0\
    );
\window_cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => \^s00_axi_aresetn_0\,
      D => \window_cnt_reg[8]_i_1_n_6\,
      Q => window_cnt_reg(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0_sync_baseline is
  port (
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_osc_axi_system_0_0_sync_baseline : entity is "sync_baseline";
end system_osc_axi_system_0_0_sync_baseline;

architecture STRUCTURE of system_osc_axi_system_0_0_sync_baseline is
  signal \^s\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \counter_reg_n_0_[12]\ : STD_LOGIC;
  signal \counter_reg_n_0_[13]\ : STD_LOGIC;
  signal \counter_reg_n_0_[14]\ : STD_LOGIC;
  signal \counter_reg_n_0_[15]\ : STD_LOGIC;
  signal \counter_reg_n_0_[16]\ : STD_LOGIC;
  signal \counter_reg_n_0_[17]\ : STD_LOGIC;
  signal \counter_reg_n_0_[18]\ : STD_LOGIC;
  signal \counter_reg_n_0_[19]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[20]\ : STD_LOGIC;
  signal \counter_reg_n_0_[21]\ : STD_LOGIC;
  signal \counter_reg_n_0_[22]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \counter_reg_n_0_[9]\ : STD_LOGIC;
  signal \NLW_counter_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
  S(0) <= \^s\(0);
\counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      O => \counter[0]_i_2_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[0]_i_1_n_7\,
      Q => \counter_reg_n_0_[0]\
    );
\counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_1_n_0\,
      CO(2) => \counter_reg[0]_i_1_n_1\,
      CO(1) => \counter_reg[0]_i_1_n_2\,
      CO(0) => \counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_1_n_4\,
      O(2) => \counter_reg[0]_i_1_n_5\,
      O(1) => \counter_reg[0]_i_1_n_6\,
      O(0) => \counter_reg[0]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[3]\,
      S(2) => \counter_reg_n_0_[2]\,
      S(1) => \counter_reg_n_0_[1]\,
      S(0) => \counter[0]_i_2_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[8]_i_1_n_5\,
      Q => \counter_reg_n_0_[10]\
    );
\counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[8]_i_1_n_4\,
      Q => \counter_reg_n_0_[11]\
    );
\counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[12]_i_1_n_7\,
      Q => \counter_reg_n_0_[12]\
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[15]\,
      S(2) => \counter_reg_n_0_[14]\,
      S(1) => \counter_reg_n_0_[13]\,
      S(0) => \counter_reg_n_0_[12]\
    );
\counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[12]_i_1_n_6\,
      Q => \counter_reg_n_0_[13]\
    );
\counter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[12]_i_1_n_5\,
      Q => \counter_reg_n_0_[14]\
    );
\counter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[12]_i_1_n_4\,
      Q => \counter_reg_n_0_[15]\
    );
\counter_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[16]_i_1_n_7\,
      Q => \counter_reg_n_0_[16]\
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[19]\,
      S(2) => \counter_reg_n_0_[18]\,
      S(1) => \counter_reg_n_0_[17]\,
      S(0) => \counter_reg_n_0_[16]\
    );
\counter_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[16]_i_1_n_6\,
      Q => \counter_reg_n_0_[17]\
    );
\counter_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[16]_i_1_n_5\,
      Q => \counter_reg_n_0_[18]\
    );
\counter_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[16]_i_1_n_4\,
      Q => \counter_reg_n_0_[19]\
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[0]_i_1_n_6\,
      Q => \counter_reg_n_0_[1]\
    );
\counter_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[20]_i_1_n_7\,
      Q => \counter_reg_n_0_[20]\
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[20]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3) => \^s\(0),
      S(2) => \counter_reg_n_0_[22]\,
      S(1) => \counter_reg_n_0_[21]\,
      S(0) => \counter_reg_n_0_[20]\
    );
\counter_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[20]_i_1_n_6\,
      Q => \counter_reg_n_0_[21]\
    );
\counter_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[20]_i_1_n_5\,
      Q => \counter_reg_n_0_[22]\
    );
\counter_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[20]_i_1_n_4\,
      Q => \^s\(0)
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[0]_i_1_n_5\,
      Q => \counter_reg_n_0_[2]\
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[0]_i_1_n_4\,
      Q => \counter_reg_n_0_[3]\
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[4]_i_1_n_7\,
      Q => \counter_reg_n_0_[4]\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_1_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[7]\,
      S(2) => \counter_reg_n_0_[6]\,
      S(1) => \counter_reg_n_0_[5]\,
      S(0) => \counter_reg_n_0_[4]\
    );
\counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[4]_i_1_n_6\,
      Q => \counter_reg_n_0_[5]\
    );
\counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[4]_i_1_n_5\,
      Q => \counter_reg_n_0_[6]\
    );
\counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[4]_i_1_n_4\,
      Q => \counter_reg_n_0_[7]\
    );
\counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[8]_i_1_n_7\,
      Q => \counter_reg_n_0_[8]\
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[11]\,
      S(2) => \counter_reg_n_0_[10]\,
      S(1) => \counter_reg_n_0_[9]\,
      S(0) => \counter_reg_n_0_[8]\
    );
\counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      CLR => SR(0),
      D => \counter_reg[8]_i_1_n_6\,
      Q => \counter_reg_n_0_[9]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0_freq_counter_axi is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_awready_reg_0 : out STD_LOGIC;
    axi_wready_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    CLK : out STD_LOGIC;
    in0 : out STD_LOGIC;
    \reg_control_reg[2]_0\ : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    led_osc : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_carry[0].carry_stage\ : in STD_LOGIC;
    \gen_inv[0].inv_stage\ : in STD_LOGIC;
    pmod_in : in STD_LOGIC;
    \cnt_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rready : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_osc_axi_system_0_0_freq_counter_axi : entity is "freq_counter_axi";
end system_osc_axi_system_0_0_freq_counter_axi;

architecture STRUCTURE of system_osc_axi_system_0_0_freq_counter_axi is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^axi_wready_reg_0\ : STD_LOGIC;
  signal \cnt[7]_i_4_n_0\ : STD_LOGIC;
  signal inst_fc_n_33 : STD_LOGIC;
  signal osc_enable : STD_LOGIC;
  signal osc_select : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal reg_control : STD_LOGIC_VECTOR ( 31 downto 3 );
  signal reg_control_1 : STD_LOGIC;
  signal reg_tap : STD_LOGIC_VECTOR ( 31 downto 6 );
  signal reg_tap_0 : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal valid_sticky : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of axi_rvalid_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair1";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
  SR(0) <= \^sr\(0);
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_wready_reg_0 <= \^axi_wready_reg_0\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFF0800"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_aresetn,
      I2 => \^axi_arready_reg_0\,
      I3 => s00_axi_arvalid,
      I4 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFF0800"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_aresetn,
      I2 => \^axi_arready_reg_0\,
      I3 => s00_axi_arvalid,
      I4 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      R => '0'
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      R => '0'
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^axi_arready_reg_0\,
      R => \^sr\(0)
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^axi_awready_reg_0\,
      I4 => p_0_in(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^axi_awready_reg_0\,
      I4 => p_0_in(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => '0'
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => '0'
    );
axi_awready_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^axi_awready_reg_0\,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^axi_awready_reg_0\,
      R => \^sr\(0)
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^axi_awready_reg_0\,
      I3 => \^axi_wready_reg_0\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => \^sr\(0)
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => \^sr\(0)
    );
axi_wready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^axi_wready_reg_0\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^axi_wready_reg_0\,
      R => \^sr\(0)
    );
\cnt[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF080F0800"
    )
        port map (
      I0 => \out\,
      I1 => osc_enable,
      I2 => osc_select(1),
      I3 => osc_select(0),
      I4 => S(0),
      I5 => \cnt[7]_i_4_n_0\,
      O => CLK
    );
\cnt[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0202020"
    )
        port map (
      I0 => pmod_in,
      I1 => osc_select(0),
      I2 => osc_select(1),
      I3 => osc_enable,
      I4 => \cnt_reg[0]\(0),
      O => \cnt[7]_i_4_n_0\
    );
inst_fc: entity work.system_osc_axi_system_0_0_freq_counter
     port map (
      Q(31 downto 6) => reg_tap(31 downto 6),
      Q(5 downto 0) => \^q\(5 downto 0),
      axi_araddr(1 downto 0) => axi_araddr(3 downto 2),
      led_osc => led_osc,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_aresetn_0 => \^sr\(0),
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      \s00_axi_rdata[31]\(31 downto 3) => reg_control(31 downto 3),
      \s00_axi_rdata[31]\(2) => osc_enable,
      \s00_axi_rdata[31]\(1 downto 0) => osc_select(1 downto 0),
      valid_reg_0 => inst_fc_n_33,
      valid_sticky => valid_sticky,
      valid_sticky_reg => \^axi_arready_reg_0\
    );
loop_in_inferred_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => osc_enable,
      I1 => \gen_carry[0].carry_stage\,
      O => in0
    );
\loop_in_inferred_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => osc_enable,
      I1 => \gen_inv[0].inv_stage\,
      O => \reg_control_reg[2]_0\
    );
\reg_control[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => \^axi_wready_reg_0\,
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => p_0_in(1),
      I5 => p_0_in(0),
      O => reg_control_1
    );
\reg_control_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(0),
      Q => osc_select(0),
      R => \^sr\(0)
    );
\reg_control_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(10),
      Q => reg_control(10),
      R => \^sr\(0)
    );
\reg_control_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(11),
      Q => reg_control(11),
      R => \^sr\(0)
    );
\reg_control_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(12),
      Q => reg_control(12),
      R => \^sr\(0)
    );
\reg_control_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(13),
      Q => reg_control(13),
      R => \^sr\(0)
    );
\reg_control_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(14),
      Q => reg_control(14),
      R => \^sr\(0)
    );
\reg_control_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(15),
      Q => reg_control(15),
      R => \^sr\(0)
    );
\reg_control_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(16),
      Q => reg_control(16),
      R => \^sr\(0)
    );
\reg_control_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(17),
      Q => reg_control(17),
      R => \^sr\(0)
    );
\reg_control_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(18),
      Q => reg_control(18),
      R => \^sr\(0)
    );
\reg_control_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(19),
      Q => reg_control(19),
      R => \^sr\(0)
    );
\reg_control_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(1),
      Q => osc_select(1),
      R => \^sr\(0)
    );
\reg_control_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(20),
      Q => reg_control(20),
      R => \^sr\(0)
    );
\reg_control_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(21),
      Q => reg_control(21),
      R => \^sr\(0)
    );
\reg_control_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(22),
      Q => reg_control(22),
      R => \^sr\(0)
    );
\reg_control_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(23),
      Q => reg_control(23),
      R => \^sr\(0)
    );
\reg_control_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(24),
      Q => reg_control(24),
      R => \^sr\(0)
    );
\reg_control_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(25),
      Q => reg_control(25),
      R => \^sr\(0)
    );
\reg_control_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(26),
      Q => reg_control(26),
      R => \^sr\(0)
    );
\reg_control_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(27),
      Q => reg_control(27),
      R => \^sr\(0)
    );
\reg_control_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(28),
      Q => reg_control(28),
      R => \^sr\(0)
    );
\reg_control_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(29),
      Q => reg_control(29),
      R => \^sr\(0)
    );
\reg_control_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(2),
      Q => osc_enable,
      R => \^sr\(0)
    );
\reg_control_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(30),
      Q => reg_control(30),
      R => \^sr\(0)
    );
\reg_control_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(31),
      Q => reg_control(31),
      R => \^sr\(0)
    );
\reg_control_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(3),
      Q => reg_control(3),
      R => \^sr\(0)
    );
\reg_control_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(4),
      Q => reg_control(4),
      R => \^sr\(0)
    );
\reg_control_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(5),
      Q => reg_control(5),
      R => \^sr\(0)
    );
\reg_control_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(6),
      Q => reg_control(6),
      R => \^sr\(0)
    );
\reg_control_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(7),
      Q => reg_control(7),
      R => \^sr\(0)
    );
\reg_control_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(8),
      Q => reg_control(8),
      R => \^sr\(0)
    );
\reg_control_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_control_1,
      D => s00_axi_wdata(9),
      Q => reg_control(9),
      R => \^sr\(0)
    );
\reg_tap[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^axi_wready_reg_0\,
      I1 => \^axi_awready_reg_0\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => p_0_in(1),
      I5 => p_0_in(0),
      O => reg_tap_0
    );
\reg_tap_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(0),
      Q => \^q\(0),
      S => \^sr\(0)
    );
\reg_tap_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(10),
      Q => reg_tap(10),
      R => \^sr\(0)
    );
\reg_tap_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(11),
      Q => reg_tap(11),
      R => \^sr\(0)
    );
\reg_tap_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(12),
      Q => reg_tap(12),
      R => \^sr\(0)
    );
\reg_tap_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(13),
      Q => reg_tap(13),
      R => \^sr\(0)
    );
\reg_tap_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(14),
      Q => reg_tap(14),
      R => \^sr\(0)
    );
\reg_tap_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(15),
      Q => reg_tap(15),
      R => \^sr\(0)
    );
\reg_tap_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(16),
      Q => reg_tap(16),
      R => \^sr\(0)
    );
\reg_tap_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(17),
      Q => reg_tap(17),
      R => \^sr\(0)
    );
\reg_tap_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(18),
      Q => reg_tap(18),
      R => \^sr\(0)
    );
\reg_tap_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(19),
      Q => reg_tap(19),
      R => \^sr\(0)
    );
\reg_tap_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(1),
      Q => \^q\(1),
      S => \^sr\(0)
    );
\reg_tap_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(20),
      Q => reg_tap(20),
      R => \^sr\(0)
    );
\reg_tap_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(21),
      Q => reg_tap(21),
      R => \^sr\(0)
    );
\reg_tap_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(22),
      Q => reg_tap(22),
      R => \^sr\(0)
    );
\reg_tap_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(23),
      Q => reg_tap(23),
      R => \^sr\(0)
    );
\reg_tap_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(24),
      Q => reg_tap(24),
      R => \^sr\(0)
    );
\reg_tap_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(25),
      Q => reg_tap(25),
      R => \^sr\(0)
    );
\reg_tap_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(26),
      Q => reg_tap(26),
      R => \^sr\(0)
    );
\reg_tap_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(27),
      Q => reg_tap(27),
      R => \^sr\(0)
    );
\reg_tap_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(28),
      Q => reg_tap(28),
      R => \^sr\(0)
    );
\reg_tap_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(29),
      Q => reg_tap(29),
      R => \^sr\(0)
    );
\reg_tap_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(2),
      Q => \^q\(2),
      S => \^sr\(0)
    );
\reg_tap_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(30),
      Q => reg_tap(30),
      R => \^sr\(0)
    );
\reg_tap_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(31),
      Q => reg_tap(31),
      R => \^sr\(0)
    );
\reg_tap_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(3),
      Q => \^q\(3),
      S => \^sr\(0)
    );
\reg_tap_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(4),
      Q => \^q\(4),
      S => \^sr\(0)
    );
\reg_tap_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(5),
      Q => \^q\(5),
      S => \^sr\(0)
    );
\reg_tap_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(6),
      Q => reg_tap(6),
      R => \^sr\(0)
    );
\reg_tap_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(7),
      Q => reg_tap(7),
      R => \^sr\(0)
    );
\reg_tap_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(8),
      Q => reg_tap(8),
      R => \^sr\(0)
    );
\reg_tap_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => reg_tap_0,
      D => s00_axi_wdata(9),
      Q => reg_tap(9),
      R => \^sr\(0)
    );
valid_sticky_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => inst_fc_n_33,
      Q => valid_sticky,
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0_osc_axi_system is
  port (
    led_osc : out STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    pmod_in : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_osc_axi_system_0_0_osc_axi_system : entity is "osc_axi_system";
end system_osc_axi_system_0_0_osc_axi_system;

architecture STRUCTURE of system_osc_axi_system_0_0_osc_axi_system is
  signal in00 : STD_LOGIC;
  signal in00_0 : STD_LOGIC;
  signal inst_axi_n_0 : STD_LOGIC;
  signal \^led_osc\ : STD_LOGIC;
  signal osc_selected : STD_LOGIC;
  signal osc_sync : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in0_in_1 : STD_LOGIC;
  signal p_0_in_2 : STD_LOGIC;
  signal tap_select : STD_LOGIC_VECTOR ( 5 downto 0 );
begin
  led_osc <= \^led_osc\;
inst_axi: entity work.system_osc_axi_system_0_0_freq_counter_axi
     port map (
      CLK => osc_selected,
      Q(5 downto 0) => tap_select(5 downto 0),
      S(0) => osc_sync,
      SR(0) => inst_axi_n_0,
      axi_arready_reg_0 => s00_axi_arready,
      axi_awready_reg_0 => s00_axi_awready,
      axi_wready_reg_0 => s00_axi_wready,
      \cnt_reg[0]\(0) => p_0_in_2,
      \gen_carry[0].carry_stage\ => p_0_in0_in,
      \gen_inv[0].inv_stage\ => p_0_in0_in_1,
      in0 => in00_0,
      led_osc => \^led_osc\,
      \out\ => p_0_in,
      pmod_in => pmod_in,
      \reg_control_reg[2]_0\ => in00,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
inst_carry: entity work.system_osc_axi_system_0_0_async_ro_carry
     port map (
      Q(5 downto 0) => tap_select(5 downto 0),
      in0 => in00_0,
      \out\ => p_0_in,
      \reg_tap_reg[5]\ => p_0_in0_in
    );
inst_lut: entity work.system_osc_axi_system_0_0_async_ro_lut
     port map (
      \gen_inv[13].inv_stage_0\ => p_0_in0_in_1,
      \gen_inv[1].inv_stage_0\ => in00,
      \out\(0) => p_0_in_2
    );
inst_presc: entity work.system_osc_axi_system_0_0_async_prescaler
     port map (
      CLK => osc_selected,
      SR(0) => inst_axi_n_0,
      led_osc => \^led_osc\
    );
inst_sync: entity work.system_osc_axi_system_0_0_sync_baseline
     port map (
      S(0) => osc_sync,
      SR(0) => inst_axi_n_0,
      s00_axi_aclk => s00_axi_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_osc_axi_system_0_0 is
  port (
    pmod_in : in STD_LOGIC;
    pmod_out : out STD_LOGIC;
    led_osc : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_osc_axi_system_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_osc_axi_system_0_0 : entity is "system_osc_axi_system_0_0,osc_axi_system,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_osc_axi_system_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_osc_axi_system_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_osc_axi_system_0_0 : entity is "osc_axi_system,Vivado 2018.3";
end system_osc_axi_system_0_0;

architecture STRUCTURE of system_osc_axi_system_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_zynq_ps_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_zynq_ps_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
begin
  pmod_out <= \<const0>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_osc_axi_system_0_0_osc_axi_system
     port map (
      led_osc => led_osc,
      pmod_in => pmod_in,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
