// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Jun  2 00:47:21 2026
// Host        : Mcvicz running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/pmich/Desktop/EIT_2_0/SEM1/vivado/projekt/repo/Async-RO-Delay-FPGA/fpga_project/oscillator/oscillator.srcs/sources_1/bd/system/ip/system_osc_axi_system_0_0/system_osc_axi_system_0_0_sim_netlist.v
// Design      : system_osc_axi_system_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_osc_axi_system_0_0,osc_axi_system,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "osc_axi_system,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module system_osc_axi_system_0_0
   (pmod_in,
    pmod_out,
    led_osc,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  input pmod_in;
  output pmod_out;
  output led_osc;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_zynq_ps_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_zynq_ps_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire led_osc;
  wire pmod_in;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;

  assign pmod_out = \<const0> ;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  system_osc_axi_system_0_0_osc_axi_system inst
       (.led_osc(led_osc),
        .pmod_in(pmod_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "async_prescaler" *) 
module system_osc_axi_system_0_0_async_prescaler
   (led_osc,
    CLK,
    SR);
  output led_osc;
  input CLK;
  input [0:0]SR;

  wire CLK;
  wire [0:0]SR;
  (* RTL_KEEP = "true" *) wire [7:0]cnt;
  wire \cnt[7]_i_3_n_0 ;
  wire [7:0]p_0_in;

  assign led_osc = cnt[7];
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt[0]),
        .O(p_0_in[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[1]_i_1 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[2]_i_1 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .I2(cnt[2]),
        .O(p_0_in[2]));
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt[3]_i_1 
       (.I0(cnt[1]),
        .I1(cnt[0]),
        .I2(cnt[2]),
        .I3(cnt[3]),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt[4]_i_1 
       (.I0(cnt[2]),
        .I1(cnt[0]),
        .I2(cnt[1]),
        .I3(cnt[3]),
        .I4(cnt[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt[5]_i_1 
       (.I0(cnt[3]),
        .I1(cnt[1]),
        .I2(cnt[0]),
        .I3(cnt[2]),
        .I4(cnt[4]),
        .I5(cnt[5]),
        .O(p_0_in[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[6]_i_1 
       (.I0(\cnt[7]_i_3_n_0 ),
        .I1(cnt[6]),
        .O(p_0_in[6]));
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[7]_i_1 
       (.I0(\cnt[7]_i_3_n_0 ),
        .I1(cnt[6]),
        .I2(cnt[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt[7]_i_3 
       (.I0(cnt[5]),
        .I1(cnt[3]),
        .I2(cnt[1]),
        .I3(cnt[0]),
        .I4(cnt[2]),
        .I5(cnt[4]),
        .O(\cnt[7]_i_3_n_0 ));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[0]),
        .Q(cnt[0]));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[1]),
        .Q(cnt[1]));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[2]),
        .Q(cnt[2]));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[3]),
        .Q(cnt[3]));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[4]),
        .Q(cnt[4]));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[5]),
        .Q(cnt[5]));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[6]),
        .Q(cnt[6]));
  (* KEEP = "yes" *) 
  FDCE \cnt_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(p_0_in[7]),
        .Q(cnt[7]));
endmodule

(* ORIG_REF_NAME = "async_ro_carry" *) 
module system_osc_axi_system_0_0_async_ro_carry
   (out,
    \reg_tap_reg[5] ,
    in0,
    Q);
  output out;
  output \reg_tap_reg[5] ;
  input in0;
  input [5:0]Q;

  wire [5:0]Q;
  wire [3:3]\gen_carry[0].co_local ;
  wire [3:3]\gen_carry[10].co_local ;
  wire [3:3]\gen_carry[11].co_local ;
  wire [3:3]\gen_carry[12].co_local ;
  wire [3:3]\gen_carry[13].co_local ;
  wire [3:3]\gen_carry[14].co_local ;
  wire [3:3]\gen_carry[15].co_local ;
  wire [3:3]\gen_carry[16].co_local ;
  wire [3:3]\gen_carry[17].co_local ;
  wire [3:3]\gen_carry[18].co_local ;
  wire [3:3]\gen_carry[19].co_local ;
  wire [3:3]\gen_carry[1].co_local ;
  wire [3:3]\gen_carry[20].co_local ;
  wire [3:3]\gen_carry[21].co_local ;
  wire [3:3]\gen_carry[22].co_local ;
  wire [3:3]\gen_carry[23].co_local ;
  wire [3:3]\gen_carry[24].co_local ;
  wire [3:3]\gen_carry[25].co_local ;
  wire [3:3]\gen_carry[26].co_local ;
  wire [3:3]\gen_carry[27].co_local ;
  wire [3:3]\gen_carry[28].co_local ;
  wire [3:3]\gen_carry[29].co_local ;
  wire [3:3]\gen_carry[2].co_local ;
  wire [3:3]\gen_carry[30].co_local ;
  wire [3:3]\gen_carry[31].co_local ;
  wire [3:3]\gen_carry[32].co_local ;
  wire [3:3]\gen_carry[33].co_local ;
  wire [3:3]\gen_carry[34].co_local ;
  wire [3:3]\gen_carry[35].co_local ;
  wire [3:3]\gen_carry[36].co_local ;
  wire [3:3]\gen_carry[37].co_local ;
  wire [3:3]\gen_carry[38].co_local ;
  wire [3:3]\gen_carry[39].co_local ;
  wire [3:3]\gen_carry[3].co_local ;
  wire [3:3]\gen_carry[40].co_local ;
  wire [3:3]\gen_carry[41].co_local ;
  wire [3:3]\gen_carry[42].co_local ;
  wire [3:3]\gen_carry[43].co_local ;
  wire [3:3]\gen_carry[44].co_local ;
  wire [3:3]\gen_carry[45].co_local ;
  wire [3:3]\gen_carry[46].co_local ;
  wire [3:3]\gen_carry[47].co_local ;
  wire [3:3]\gen_carry[48].co_local ;
  wire [3:3]\gen_carry[49].co_local ;
  wire [3:3]\gen_carry[4].co_local ;
  wire [3:3]\gen_carry[50].co_local ;
  wire [3:3]\gen_carry[51].co_local ;
  wire [3:3]\gen_carry[52].co_local ;
  wire [3:3]\gen_carry[53].co_local ;
  wire [3:3]\gen_carry[54].co_local ;
  wire [3:3]\gen_carry[55].co_local ;
  wire [3:3]\gen_carry[56].co_local ;
  wire [3:3]\gen_carry[57].co_local ;
  wire [3:3]\gen_carry[58].co_local ;
  wire [3:3]\gen_carry[59].co_local ;
  wire [3:3]\gen_carry[5].co_local ;
  wire [3:3]\gen_carry[60].co_local ;
  wire [3:3]\gen_carry[61].co_local ;
  wire [3:3]\gen_carry[62].co_local ;
  wire [3:3]\gen_carry[63].co_local ;
  wire [3:3]\gen_carry[6].co_local ;
  wire [3:3]\gen_carry[7].co_local ;
  wire [3:3]\gen_carry[8].co_local ;
  wire [3:3]\gen_carry[9].co_local ;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire loop_in;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire ring_feedback;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire selected_tap;
  wire selected_tap_inferred_i_10_n_0;
  wire selected_tap_inferred_i_11_n_0;
  wire selected_tap_inferred_i_12_n_0;
  wire selected_tap_inferred_i_13_n_0;
  wire selected_tap_inferred_i_14_n_0;
  wire selected_tap_inferred_i_15_n_0;
  wire selected_tap_inferred_i_16_n_0;
  wire selected_tap_inferred_i_17_n_0;
  wire selected_tap_inferred_i_18_n_0;
  wire selected_tap_inferred_i_19_n_0;
  wire selected_tap_inferred_i_20_n_0;
  wire selected_tap_inferred_i_21_n_0;
  wire selected_tap_inferred_i_22_n_0;
  wire selected_tap_inferred_i_23_n_0;
  wire selected_tap_inferred_i_24_n_0;
  wire selected_tap_inferred_i_25_n_0;
  wire selected_tap_inferred_i_26_n_0;
  wire selected_tap_inferred_i_27_n_0;
  wire selected_tap_inferred_i_28_n_0;
  wire selected_tap_inferred_i_29_n_0;
  wire selected_tap_inferred_i_2_n_0;
  wire selected_tap_inferred_i_3_n_0;
  wire selected_tap_inferred_i_4_n_0;
  wire selected_tap_inferred_i_5_n_0;
  wire selected_tap_inferred_i_6_n_0;
  wire selected_tap_inferred_i_7_n_0;
  wire selected_tap_inferred_i_8_n_0;
  wire selected_tap_inferred_i_9_n_0;
  wire [2:0]\NLW_gen_carry[0].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[0].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[10].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[10].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[11].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[11].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[12].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[12].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[13].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[13].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[14].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[14].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[15].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[15].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[16].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[16].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[17].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[17].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[18].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[18].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[19].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[19].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[1].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[1].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[20].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[20].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[21].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[21].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[22].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[22].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[23].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[23].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[24].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[24].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[25].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[25].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[26].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[26].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[27].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[27].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[28].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[28].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[29].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[29].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[2].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[2].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[30].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[30].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[31].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[31].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[32].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[32].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[33].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[33].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[34].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[34].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[35].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[35].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[36].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[36].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[37].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[37].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[38].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[38].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[39].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[39].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[3].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[3].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[40].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[40].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[41].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[41].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[42].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[42].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[43].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[43].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[44].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[44].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[45].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[45].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[46].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[46].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[47].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[47].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[48].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[48].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[49].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[49].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[4].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[4].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[50].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[50].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[51].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[51].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[52].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[52].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[53].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[53].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[54].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[54].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[55].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[55].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[56].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[56].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[57].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[57].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[58].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[58].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[59].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[59].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[5].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[5].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[60].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[60].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[61].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[61].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[62].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[62].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[63].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[63].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[6].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[6].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[7].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[7].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[8].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[8].carry_stage_O_UNCONNECTED ;
  wire [2:0]\NLW_gen_carry[9].carry_stage_CO_UNCONNECTED ;
  wire [3:0]\NLW_gen_carry[9].carry_stage_O_UNCONNECTED ;

  assign loop_in = in0;
  assign out = selected_tap;
  assign \reg_tap_reg[5]  = ring_feedback;
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[0].carry_stage 
       (.CI(1'b0),
        .CO({\gen_carry[0].co_local ,\NLW_gen_carry[0].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(loop_in),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[0].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[10].carry_stage 
       (.CI(\gen_carry[9].co_local ),
        .CO({\gen_carry[10].co_local ,\NLW_gen_carry[10].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[10].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[11].carry_stage 
       (.CI(\gen_carry[10].co_local ),
        .CO({\gen_carry[11].co_local ,\NLW_gen_carry[11].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[11].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[12].carry_stage 
       (.CI(\gen_carry[11].co_local ),
        .CO({\gen_carry[12].co_local ,\NLW_gen_carry[12].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[12].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[13].carry_stage 
       (.CI(\gen_carry[12].co_local ),
        .CO({\gen_carry[13].co_local ,\NLW_gen_carry[13].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[13].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[14].carry_stage 
       (.CI(\gen_carry[13].co_local ),
        .CO({\gen_carry[14].co_local ,\NLW_gen_carry[14].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[14].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[15].carry_stage 
       (.CI(\gen_carry[14].co_local ),
        .CO({\gen_carry[15].co_local ,\NLW_gen_carry[15].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[15].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[16].carry_stage 
       (.CI(\gen_carry[15].co_local ),
        .CO({\gen_carry[16].co_local ,\NLW_gen_carry[16].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[16].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[17].carry_stage 
       (.CI(\gen_carry[16].co_local ),
        .CO({\gen_carry[17].co_local ,\NLW_gen_carry[17].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[17].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[18].carry_stage 
       (.CI(\gen_carry[17].co_local ),
        .CO({\gen_carry[18].co_local ,\NLW_gen_carry[18].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[18].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[19].carry_stage 
       (.CI(\gen_carry[18].co_local ),
        .CO({\gen_carry[19].co_local ,\NLW_gen_carry[19].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[19].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[1].carry_stage 
       (.CI(\gen_carry[0].co_local ),
        .CO({\gen_carry[1].co_local ,\NLW_gen_carry[1].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[1].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[20].carry_stage 
       (.CI(\gen_carry[19].co_local ),
        .CO({\gen_carry[20].co_local ,\NLW_gen_carry[20].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[20].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[21].carry_stage 
       (.CI(\gen_carry[20].co_local ),
        .CO({\gen_carry[21].co_local ,\NLW_gen_carry[21].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[21].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[22].carry_stage 
       (.CI(\gen_carry[21].co_local ),
        .CO({\gen_carry[22].co_local ,\NLW_gen_carry[22].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[22].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[23].carry_stage 
       (.CI(\gen_carry[22].co_local ),
        .CO({\gen_carry[23].co_local ,\NLW_gen_carry[23].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[23].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[24].carry_stage 
       (.CI(\gen_carry[23].co_local ),
        .CO({\gen_carry[24].co_local ,\NLW_gen_carry[24].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[24].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[25].carry_stage 
       (.CI(\gen_carry[24].co_local ),
        .CO({\gen_carry[25].co_local ,\NLW_gen_carry[25].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[25].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[26].carry_stage 
       (.CI(\gen_carry[25].co_local ),
        .CO({\gen_carry[26].co_local ,\NLW_gen_carry[26].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[26].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[27].carry_stage 
       (.CI(\gen_carry[26].co_local ),
        .CO({\gen_carry[27].co_local ,\NLW_gen_carry[27].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[27].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[28].carry_stage 
       (.CI(\gen_carry[27].co_local ),
        .CO({\gen_carry[28].co_local ,\NLW_gen_carry[28].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[28].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[29].carry_stage 
       (.CI(\gen_carry[28].co_local ),
        .CO({\gen_carry[29].co_local ,\NLW_gen_carry[29].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[29].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[2].carry_stage 
       (.CI(\gen_carry[1].co_local ),
        .CO({\gen_carry[2].co_local ,\NLW_gen_carry[2].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[2].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[30].carry_stage 
       (.CI(\gen_carry[29].co_local ),
        .CO({\gen_carry[30].co_local ,\NLW_gen_carry[30].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[30].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[31].carry_stage 
       (.CI(\gen_carry[30].co_local ),
        .CO({\gen_carry[31].co_local ,\NLW_gen_carry[31].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[31].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[32].carry_stage 
       (.CI(\gen_carry[31].co_local ),
        .CO({\gen_carry[32].co_local ,\NLW_gen_carry[32].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[32].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[33].carry_stage 
       (.CI(\gen_carry[32].co_local ),
        .CO({\gen_carry[33].co_local ,\NLW_gen_carry[33].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[33].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[34].carry_stage 
       (.CI(\gen_carry[33].co_local ),
        .CO({\gen_carry[34].co_local ,\NLW_gen_carry[34].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[34].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[35].carry_stage 
       (.CI(\gen_carry[34].co_local ),
        .CO({\gen_carry[35].co_local ,\NLW_gen_carry[35].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[35].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[36].carry_stage 
       (.CI(\gen_carry[35].co_local ),
        .CO({\gen_carry[36].co_local ,\NLW_gen_carry[36].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[36].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[37].carry_stage 
       (.CI(\gen_carry[36].co_local ),
        .CO({\gen_carry[37].co_local ,\NLW_gen_carry[37].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[37].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[38].carry_stage 
       (.CI(\gen_carry[37].co_local ),
        .CO({\gen_carry[38].co_local ,\NLW_gen_carry[38].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[38].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[39].carry_stage 
       (.CI(\gen_carry[38].co_local ),
        .CO({\gen_carry[39].co_local ,\NLW_gen_carry[39].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[39].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[3].carry_stage 
       (.CI(\gen_carry[2].co_local ),
        .CO({\gen_carry[3].co_local ,\NLW_gen_carry[3].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[3].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[40].carry_stage 
       (.CI(\gen_carry[39].co_local ),
        .CO({\gen_carry[40].co_local ,\NLW_gen_carry[40].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[40].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[41].carry_stage 
       (.CI(\gen_carry[40].co_local ),
        .CO({\gen_carry[41].co_local ,\NLW_gen_carry[41].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[41].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[42].carry_stage 
       (.CI(\gen_carry[41].co_local ),
        .CO({\gen_carry[42].co_local ,\NLW_gen_carry[42].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[42].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[43].carry_stage 
       (.CI(\gen_carry[42].co_local ),
        .CO({\gen_carry[43].co_local ,\NLW_gen_carry[43].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[43].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[44].carry_stage 
       (.CI(\gen_carry[43].co_local ),
        .CO({\gen_carry[44].co_local ,\NLW_gen_carry[44].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[44].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[45].carry_stage 
       (.CI(\gen_carry[44].co_local ),
        .CO({\gen_carry[45].co_local ,\NLW_gen_carry[45].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[45].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[46].carry_stage 
       (.CI(\gen_carry[45].co_local ),
        .CO({\gen_carry[46].co_local ,\NLW_gen_carry[46].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[46].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[47].carry_stage 
       (.CI(\gen_carry[46].co_local ),
        .CO({\gen_carry[47].co_local ,\NLW_gen_carry[47].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[47].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[48].carry_stage 
       (.CI(\gen_carry[47].co_local ),
        .CO({\gen_carry[48].co_local ,\NLW_gen_carry[48].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[48].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[49].carry_stage 
       (.CI(\gen_carry[48].co_local ),
        .CO({\gen_carry[49].co_local ,\NLW_gen_carry[49].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[49].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[4].carry_stage 
       (.CI(\gen_carry[3].co_local ),
        .CO({\gen_carry[4].co_local ,\NLW_gen_carry[4].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[4].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[50].carry_stage 
       (.CI(\gen_carry[49].co_local ),
        .CO({\gen_carry[50].co_local ,\NLW_gen_carry[50].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[50].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[51].carry_stage 
       (.CI(\gen_carry[50].co_local ),
        .CO({\gen_carry[51].co_local ,\NLW_gen_carry[51].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[51].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[52].carry_stage 
       (.CI(\gen_carry[51].co_local ),
        .CO({\gen_carry[52].co_local ,\NLW_gen_carry[52].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[52].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[53].carry_stage 
       (.CI(\gen_carry[52].co_local ),
        .CO({\gen_carry[53].co_local ,\NLW_gen_carry[53].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[53].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[54].carry_stage 
       (.CI(\gen_carry[53].co_local ),
        .CO({\gen_carry[54].co_local ,\NLW_gen_carry[54].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[54].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[55].carry_stage 
       (.CI(\gen_carry[54].co_local ),
        .CO({\gen_carry[55].co_local ,\NLW_gen_carry[55].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[55].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[56].carry_stage 
       (.CI(\gen_carry[55].co_local ),
        .CO({\gen_carry[56].co_local ,\NLW_gen_carry[56].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[56].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[57].carry_stage 
       (.CI(\gen_carry[56].co_local ),
        .CO({\gen_carry[57].co_local ,\NLW_gen_carry[57].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[57].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[58].carry_stage 
       (.CI(\gen_carry[57].co_local ),
        .CO({\gen_carry[58].co_local ,\NLW_gen_carry[58].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[58].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[59].carry_stage 
       (.CI(\gen_carry[58].co_local ),
        .CO({\gen_carry[59].co_local ,\NLW_gen_carry[59].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[59].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[5].carry_stage 
       (.CI(\gen_carry[4].co_local ),
        .CO({\gen_carry[5].co_local ,\NLW_gen_carry[5].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[5].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[60].carry_stage 
       (.CI(\gen_carry[59].co_local ),
        .CO({\gen_carry[60].co_local ,\NLW_gen_carry[60].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[60].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[61].carry_stage 
       (.CI(\gen_carry[60].co_local ),
        .CO({\gen_carry[61].co_local ,\NLW_gen_carry[61].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[61].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[62].carry_stage 
       (.CI(\gen_carry[61].co_local ),
        .CO({\gen_carry[62].co_local ,\NLW_gen_carry[62].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[62].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[63].carry_stage 
       (.CI(\gen_carry[62].co_local ),
        .CO({\gen_carry[63].co_local ,\NLW_gen_carry[63].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[63].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[6].carry_stage 
       (.CI(\gen_carry[5].co_local ),
        .CO({\gen_carry[6].co_local ,\NLW_gen_carry[6].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[6].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[7].carry_stage 
       (.CI(\gen_carry[6].co_local ),
        .CO({\gen_carry[7].co_local ,\NLW_gen_carry[7].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[7].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[8].carry_stage 
       (.CI(\gen_carry[7].co_local ),
        .CO({\gen_carry[8].co_local ,\NLW_gen_carry[8].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[8].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* KEEP = "true" *) 
  CARRY4 \gen_carry[9].carry_stage 
       (.CI(\gen_carry[8].co_local ),
        .CO({\gen_carry[9].co_local ,\NLW_gen_carry[9].carry_stage_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gen_carry[9].carry_stage_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    loop_inverter
       (.I0(selected_tap),
        .O(ring_feedback));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_1
       (.I0(selected_tap_inferred_i_2_n_0),
        .I1(selected_tap_inferred_i_3_n_0),
        .I2(Q[5]),
        .I3(selected_tap_inferred_i_4_n_0),
        .I4(Q[4]),
        .I5(selected_tap_inferred_i_5_n_0),
        .O(selected_tap));
  MUXF7 selected_tap_inferred_i_10
       (.I0(selected_tap_inferred_i_22_n_0),
        .I1(selected_tap_inferred_i_23_n_0),
        .O(selected_tap_inferred_i_10_n_0),
        .S(Q[2]));
  MUXF7 selected_tap_inferred_i_11
       (.I0(selected_tap_inferred_i_24_n_0),
        .I1(selected_tap_inferred_i_25_n_0),
        .O(selected_tap_inferred_i_11_n_0),
        .S(Q[2]));
  MUXF7 selected_tap_inferred_i_12
       (.I0(selected_tap_inferred_i_26_n_0),
        .I1(selected_tap_inferred_i_27_n_0),
        .O(selected_tap_inferred_i_12_n_0),
        .S(Q[2]));
  MUXF7 selected_tap_inferred_i_13
       (.I0(selected_tap_inferred_i_28_n_0),
        .I1(selected_tap_inferred_i_29_n_0),
        .O(selected_tap_inferred_i_13_n_0),
        .S(Q[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_14
       (.I0(\gen_carry[51].co_local ),
        .I1(\gen_carry[50].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[49].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[48].co_local ),
        .O(selected_tap_inferred_i_14_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_15
       (.I0(\gen_carry[55].co_local ),
        .I1(\gen_carry[54].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[53].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[52].co_local ),
        .O(selected_tap_inferred_i_15_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_16
       (.I0(\gen_carry[59].co_local ),
        .I1(\gen_carry[58].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[57].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[56].co_local ),
        .O(selected_tap_inferred_i_16_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_17
       (.I0(\gen_carry[63].co_local ),
        .I1(\gen_carry[62].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[61].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[60].co_local ),
        .O(selected_tap_inferred_i_17_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_18
       (.I0(\gen_carry[35].co_local ),
        .I1(\gen_carry[34].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[33].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[32].co_local ),
        .O(selected_tap_inferred_i_18_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_19
       (.I0(\gen_carry[39].co_local ),
        .I1(\gen_carry[38].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[37].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[36].co_local ),
        .O(selected_tap_inferred_i_19_n_0));
  MUXF8 selected_tap_inferred_i_2
       (.I0(selected_tap_inferred_i_6_n_0),
        .I1(selected_tap_inferred_i_7_n_0),
        .O(selected_tap_inferred_i_2_n_0),
        .S(Q[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_20
       (.I0(\gen_carry[43].co_local ),
        .I1(\gen_carry[42].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[41].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[40].co_local ),
        .O(selected_tap_inferred_i_20_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_21
       (.I0(\gen_carry[47].co_local ),
        .I1(\gen_carry[46].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[45].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[44].co_local ),
        .O(selected_tap_inferred_i_21_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_22
       (.I0(\gen_carry[19].co_local ),
        .I1(\gen_carry[18].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[17].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[16].co_local ),
        .O(selected_tap_inferred_i_22_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_23
       (.I0(\gen_carry[23].co_local ),
        .I1(\gen_carry[22].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[21].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[20].co_local ),
        .O(selected_tap_inferred_i_23_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_24
       (.I0(\gen_carry[27].co_local ),
        .I1(\gen_carry[26].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[25].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[24].co_local ),
        .O(selected_tap_inferred_i_24_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_25
       (.I0(\gen_carry[31].co_local ),
        .I1(\gen_carry[30].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[29].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[28].co_local ),
        .O(selected_tap_inferred_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_26
       (.I0(\gen_carry[3].co_local ),
        .I1(\gen_carry[2].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[1].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[0].co_local ),
        .O(selected_tap_inferred_i_26_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_27
       (.I0(\gen_carry[7].co_local ),
        .I1(\gen_carry[6].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[5].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[4].co_local ),
        .O(selected_tap_inferred_i_27_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_28
       (.I0(\gen_carry[11].co_local ),
        .I1(\gen_carry[10].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[9].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[8].co_local ),
        .O(selected_tap_inferred_i_28_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    selected_tap_inferred_i_29
       (.I0(\gen_carry[15].co_local ),
        .I1(\gen_carry[14].co_local ),
        .I2(Q[1]),
        .I3(\gen_carry[13].co_local ),
        .I4(Q[0]),
        .I5(\gen_carry[12].co_local ),
        .O(selected_tap_inferred_i_29_n_0));
  MUXF8 selected_tap_inferred_i_3
       (.I0(selected_tap_inferred_i_8_n_0),
        .I1(selected_tap_inferred_i_9_n_0),
        .O(selected_tap_inferred_i_3_n_0),
        .S(Q[3]));
  MUXF8 selected_tap_inferred_i_4
       (.I0(selected_tap_inferred_i_10_n_0),
        .I1(selected_tap_inferred_i_11_n_0),
        .O(selected_tap_inferred_i_4_n_0),
        .S(Q[3]));
  MUXF8 selected_tap_inferred_i_5
       (.I0(selected_tap_inferred_i_12_n_0),
        .I1(selected_tap_inferred_i_13_n_0),
        .O(selected_tap_inferred_i_5_n_0),
        .S(Q[3]));
  MUXF7 selected_tap_inferred_i_6
       (.I0(selected_tap_inferred_i_14_n_0),
        .I1(selected_tap_inferred_i_15_n_0),
        .O(selected_tap_inferred_i_6_n_0),
        .S(Q[2]));
  MUXF7 selected_tap_inferred_i_7
       (.I0(selected_tap_inferred_i_16_n_0),
        .I1(selected_tap_inferred_i_17_n_0),
        .O(selected_tap_inferred_i_7_n_0),
        .S(Q[2]));
  MUXF7 selected_tap_inferred_i_8
       (.I0(selected_tap_inferred_i_18_n_0),
        .I1(selected_tap_inferred_i_19_n_0),
        .O(selected_tap_inferred_i_8_n_0),
        .S(Q[2]));
  MUXF7 selected_tap_inferred_i_9
       (.I0(selected_tap_inferred_i_20_n_0),
        .I1(selected_tap_inferred_i_21_n_0),
        .O(selected_tap_inferred_i_9_n_0),
        .S(Q[2]));
endmodule

(* ORIG_REF_NAME = "async_ro_lut" *) 
module system_osc_axi_system_0_0_async_ro_lut
   (out,
    \gen_inv[13].inv_stage_0 ,
    \gen_inv[1].inv_stage_0 );
  output [0:0]out;
  output \gen_inv[13].inv_stage_0 ;
  input \gen_inv[1].inv_stage_0 ;

  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire [15:0]chain;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire loop_in;
  (* DONT_TOUCH *) (* RTL_KEEP = "true" *) wire ring_feedback;

  assign \gen_inv[13].inv_stage_0  = ring_feedback;
  assign loop_in = \gen_inv[1].inv_stage_0 ;
  assign out[0] = chain[15];
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[0].inv_stage 
       (.I0(chain[0]),
        .O(chain[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[10].inv_stage 
       (.I0(chain[10]),
        .O(chain[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[11].inv_stage 
       (.I0(chain[11]),
        .O(chain[12]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[12].inv_stage 
       (.I0(chain[12]),
        .O(chain[13]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[13].inv_stage 
       (.I0(chain[13]),
        .O(chain[14]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[14].inv_stage 
       (.I0(chain[14]),
        .O(chain[15]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[1].inv_stage 
       (.I0(chain[1]),
        .O(chain[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[2].inv_stage 
       (.I0(chain[2]),
        .O(chain[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[3].inv_stage 
       (.I0(chain[3]),
        .O(chain[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[4].inv_stage 
       (.I0(chain[4]),
        .O(chain[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[5].inv_stage 
       (.I0(chain[5]),
        .O(chain[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[6].inv_stage 
       (.I0(chain[6]),
        .O(chain[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[7].inv_stage 
       (.I0(chain[7]),
        .O(chain[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[8].inv_stage 
       (.I0(chain[8]),
        .O(chain[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  (* KEEP = "true" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \gen_inv[9].inv_stage 
       (.I0(chain[9]),
        .O(chain[10]));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(chain[15]),
        .O(ring_feedback));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(loop_in),
        .O(chain[0]));
endmodule

(* ORIG_REF_NAME = "freq_counter" *) 
module system_osc_axi_system_0_0_freq_counter
   (s00_axi_aresetn_0,
    s00_axi_rdata,
    valid_reg_0,
    led_osc,
    s00_axi_aclk,
    s00_axi_aresetn,
    Q,
    \s00_axi_rdata[31] ,
    axi_araddr,
    valid_sticky,
    s00_axi_arvalid,
    valid_sticky_reg,
    s00_axi_araddr);
  output s00_axi_aresetn_0;
  output [31:0]s00_axi_rdata;
  output valid_reg_0;
  input led_osc;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [31:0]Q;
  input [31:0]\s00_axi_rdata[31] ;
  input [1:0]axi_araddr;
  input valid_sticky;
  input s00_axi_arvalid;
  input valid_sticky_reg;
  input [1:0]s00_axi_araddr;

  wire [31:0]Q;
  wire [1:0]axi_araddr;
  wire \edge_cnt[0]_i_1_n_0 ;
  wire \edge_cnt[0]_i_3_n_0 ;
  wire \edge_cnt[0]_i_4_n_0 ;
  wire \edge_cnt[0]_i_5_n_0 ;
  wire \edge_cnt[0]_i_6_n_0 ;
  wire \edge_cnt[0]_i_7_n_0 ;
  wire \edge_cnt[12]_i_2_n_0 ;
  wire \edge_cnt[12]_i_3_n_0 ;
  wire \edge_cnt[12]_i_4_n_0 ;
  wire \edge_cnt[12]_i_5_n_0 ;
  wire \edge_cnt[16]_i_2_n_0 ;
  wire \edge_cnt[16]_i_3_n_0 ;
  wire \edge_cnt[16]_i_4_n_0 ;
  wire \edge_cnt[16]_i_5_n_0 ;
  wire \edge_cnt[20]_i_2_n_0 ;
  wire \edge_cnt[20]_i_3_n_0 ;
  wire \edge_cnt[20]_i_4_n_0 ;
  wire \edge_cnt[20]_i_5_n_0 ;
  wire \edge_cnt[24]_i_2_n_0 ;
  wire \edge_cnt[24]_i_3_n_0 ;
  wire \edge_cnt[24]_i_4_n_0 ;
  wire \edge_cnt[24]_i_5_n_0 ;
  wire \edge_cnt[28]_i_2_n_0 ;
  wire \edge_cnt[28]_i_3_n_0 ;
  wire \edge_cnt[28]_i_4_n_0 ;
  wire \edge_cnt[28]_i_5_n_0 ;
  wire \edge_cnt[4]_i_2_n_0 ;
  wire \edge_cnt[4]_i_3_n_0 ;
  wire \edge_cnt[4]_i_4_n_0 ;
  wire \edge_cnt[4]_i_5_n_0 ;
  wire \edge_cnt[8]_i_2_n_0 ;
  wire \edge_cnt[8]_i_3_n_0 ;
  wire \edge_cnt[8]_i_4_n_0 ;
  wire \edge_cnt[8]_i_5_n_0 ;
  wire [31:0]edge_cnt_reg;
  wire \edge_cnt_reg[0]_i_2_n_0 ;
  wire \edge_cnt_reg[0]_i_2_n_1 ;
  wire \edge_cnt_reg[0]_i_2_n_2 ;
  wire \edge_cnt_reg[0]_i_2_n_3 ;
  wire \edge_cnt_reg[0]_i_2_n_4 ;
  wire \edge_cnt_reg[0]_i_2_n_5 ;
  wire \edge_cnt_reg[0]_i_2_n_6 ;
  wire \edge_cnt_reg[0]_i_2_n_7 ;
  wire \edge_cnt_reg[12]_i_1_n_0 ;
  wire \edge_cnt_reg[12]_i_1_n_1 ;
  wire \edge_cnt_reg[12]_i_1_n_2 ;
  wire \edge_cnt_reg[12]_i_1_n_3 ;
  wire \edge_cnt_reg[12]_i_1_n_4 ;
  wire \edge_cnt_reg[12]_i_1_n_5 ;
  wire \edge_cnt_reg[12]_i_1_n_6 ;
  wire \edge_cnt_reg[12]_i_1_n_7 ;
  wire \edge_cnt_reg[16]_i_1_n_0 ;
  wire \edge_cnt_reg[16]_i_1_n_1 ;
  wire \edge_cnt_reg[16]_i_1_n_2 ;
  wire \edge_cnt_reg[16]_i_1_n_3 ;
  wire \edge_cnt_reg[16]_i_1_n_4 ;
  wire \edge_cnt_reg[16]_i_1_n_5 ;
  wire \edge_cnt_reg[16]_i_1_n_6 ;
  wire \edge_cnt_reg[16]_i_1_n_7 ;
  wire \edge_cnt_reg[20]_i_1_n_0 ;
  wire \edge_cnt_reg[20]_i_1_n_1 ;
  wire \edge_cnt_reg[20]_i_1_n_2 ;
  wire \edge_cnt_reg[20]_i_1_n_3 ;
  wire \edge_cnt_reg[20]_i_1_n_4 ;
  wire \edge_cnt_reg[20]_i_1_n_5 ;
  wire \edge_cnt_reg[20]_i_1_n_6 ;
  wire \edge_cnt_reg[20]_i_1_n_7 ;
  wire \edge_cnt_reg[24]_i_1_n_0 ;
  wire \edge_cnt_reg[24]_i_1_n_1 ;
  wire \edge_cnt_reg[24]_i_1_n_2 ;
  wire \edge_cnt_reg[24]_i_1_n_3 ;
  wire \edge_cnt_reg[24]_i_1_n_4 ;
  wire \edge_cnt_reg[24]_i_1_n_5 ;
  wire \edge_cnt_reg[24]_i_1_n_6 ;
  wire \edge_cnt_reg[24]_i_1_n_7 ;
  wire \edge_cnt_reg[28]_i_1_n_1 ;
  wire \edge_cnt_reg[28]_i_1_n_2 ;
  wire \edge_cnt_reg[28]_i_1_n_3 ;
  wire \edge_cnt_reg[28]_i_1_n_4 ;
  wire \edge_cnt_reg[28]_i_1_n_5 ;
  wire \edge_cnt_reg[28]_i_1_n_6 ;
  wire \edge_cnt_reg[28]_i_1_n_7 ;
  wire \edge_cnt_reg[4]_i_1_n_0 ;
  wire \edge_cnt_reg[4]_i_1_n_1 ;
  wire \edge_cnt_reg[4]_i_1_n_2 ;
  wire \edge_cnt_reg[4]_i_1_n_3 ;
  wire \edge_cnt_reg[4]_i_1_n_4 ;
  wire \edge_cnt_reg[4]_i_1_n_5 ;
  wire \edge_cnt_reg[4]_i_1_n_6 ;
  wire \edge_cnt_reg[4]_i_1_n_7 ;
  wire \edge_cnt_reg[8]_i_1_n_0 ;
  wire \edge_cnt_reg[8]_i_1_n_1 ;
  wire \edge_cnt_reg[8]_i_1_n_2 ;
  wire \edge_cnt_reg[8]_i_1_n_3 ;
  wire \edge_cnt_reg[8]_i_1_n_4 ;
  wire \edge_cnt_reg[8]_i_1_n_5 ;
  wire \edge_cnt_reg[8]_i_1_n_6 ;
  wire \edge_cnt_reg[8]_i_1_n_7 ;
  wire [31:0]freq_count;
  wire freq_valid;
  wire led_osc;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_aresetn_0;
  wire s00_axi_arvalid;
  wire [31:0]s00_axi_rdata;
  wire [31:0]\s00_axi_rdata[31] ;
  wire sync_ff1;
  wire sync_ff2;
  wire sync_ff3;
  wire valid_i_2_n_0;
  wire valid_i_3_n_0;
  wire valid_i_4_n_0;
  wire valid_reg_0;
  wire valid_sticky;
  wire valid_sticky_reg;
  wire \window_cnt[0]_i_2_n_0 ;
  wire \window_cnt[0]_i_3_n_0 ;
  wire \window_cnt[0]_i_4_n_0 ;
  wire \window_cnt[0]_i_5_n_0 ;
  wire \window_cnt[0]_i_6_n_0 ;
  wire \window_cnt[12]_i_2_n_0 ;
  wire \window_cnt[12]_i_3_n_0 ;
  wire \window_cnt[12]_i_4_n_0 ;
  wire \window_cnt[12]_i_5_n_0 ;
  wire \window_cnt[16]_i_2_n_0 ;
  wire \window_cnt[4]_i_2_n_0 ;
  wire \window_cnt[4]_i_3_n_0 ;
  wire \window_cnt[4]_i_4_n_0 ;
  wire \window_cnt[4]_i_5_n_0 ;
  wire \window_cnt[8]_i_2_n_0 ;
  wire \window_cnt[8]_i_3_n_0 ;
  wire \window_cnt[8]_i_4_n_0 ;
  wire \window_cnt[8]_i_5_n_0 ;
  wire [16:0]window_cnt_reg;
  wire \window_cnt_reg[0]_i_1_n_0 ;
  wire \window_cnt_reg[0]_i_1_n_1 ;
  wire \window_cnt_reg[0]_i_1_n_2 ;
  wire \window_cnt_reg[0]_i_1_n_3 ;
  wire \window_cnt_reg[0]_i_1_n_4 ;
  wire \window_cnt_reg[0]_i_1_n_5 ;
  wire \window_cnt_reg[0]_i_1_n_6 ;
  wire \window_cnt_reg[0]_i_1_n_7 ;
  wire \window_cnt_reg[12]_i_1_n_0 ;
  wire \window_cnt_reg[12]_i_1_n_1 ;
  wire \window_cnt_reg[12]_i_1_n_2 ;
  wire \window_cnt_reg[12]_i_1_n_3 ;
  wire \window_cnt_reg[12]_i_1_n_4 ;
  wire \window_cnt_reg[12]_i_1_n_5 ;
  wire \window_cnt_reg[12]_i_1_n_6 ;
  wire \window_cnt_reg[12]_i_1_n_7 ;
  wire \window_cnt_reg[16]_i_1_n_7 ;
  wire \window_cnt_reg[4]_i_1_n_0 ;
  wire \window_cnt_reg[4]_i_1_n_1 ;
  wire \window_cnt_reg[4]_i_1_n_2 ;
  wire \window_cnt_reg[4]_i_1_n_3 ;
  wire \window_cnt_reg[4]_i_1_n_4 ;
  wire \window_cnt_reg[4]_i_1_n_5 ;
  wire \window_cnt_reg[4]_i_1_n_6 ;
  wire \window_cnt_reg[4]_i_1_n_7 ;
  wire \window_cnt_reg[8]_i_1_n_0 ;
  wire \window_cnt_reg[8]_i_1_n_1 ;
  wire \window_cnt_reg[8]_i_1_n_2 ;
  wire \window_cnt_reg[8]_i_1_n_3 ;
  wire \window_cnt_reg[8]_i_1_n_4 ;
  wire \window_cnt_reg[8]_i_1_n_5 ;
  wire \window_cnt_reg[8]_i_1_n_6 ;
  wire \window_cnt_reg[8]_i_1_n_7 ;
  wire window_done;
  wire [3:3]\NLW_edge_cnt_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_window_cnt_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_window_cnt_reg[16]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(s00_axi_aresetn_0));
  LUT3 #(
    .INIT(8'hBA)) 
    \edge_cnt[0]_i_1 
       (.I0(window_done),
        .I1(sync_ff3),
        .I2(sync_ff2),
        .O(\edge_cnt[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[0]_i_3 
       (.I0(edge_cnt_reg[0]),
        .I1(window_done),
        .O(\edge_cnt[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[0]_i_4 
       (.I0(edge_cnt_reg[3]),
        .I1(window_done),
        .O(\edge_cnt[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[0]_i_5 
       (.I0(edge_cnt_reg[2]),
        .I1(window_done),
        .O(\edge_cnt[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[0]_i_6 
       (.I0(edge_cnt_reg[1]),
        .I1(window_done),
        .O(\edge_cnt[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \edge_cnt[0]_i_7 
       (.I0(edge_cnt_reg[0]),
        .I1(window_done),
        .O(\edge_cnt[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[12]_i_2 
       (.I0(edge_cnt_reg[15]),
        .I1(window_done),
        .O(\edge_cnt[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[12]_i_3 
       (.I0(edge_cnt_reg[14]),
        .I1(window_done),
        .O(\edge_cnt[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[12]_i_4 
       (.I0(edge_cnt_reg[13]),
        .I1(window_done),
        .O(\edge_cnt[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[12]_i_5 
       (.I0(edge_cnt_reg[12]),
        .I1(window_done),
        .O(\edge_cnt[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[16]_i_2 
       (.I0(edge_cnt_reg[19]),
        .I1(window_done),
        .O(\edge_cnt[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[16]_i_3 
       (.I0(edge_cnt_reg[18]),
        .I1(window_done),
        .O(\edge_cnt[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[16]_i_4 
       (.I0(edge_cnt_reg[17]),
        .I1(window_done),
        .O(\edge_cnt[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[16]_i_5 
       (.I0(edge_cnt_reg[16]),
        .I1(window_done),
        .O(\edge_cnt[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[20]_i_2 
       (.I0(edge_cnt_reg[23]),
        .I1(window_done),
        .O(\edge_cnt[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[20]_i_3 
       (.I0(edge_cnt_reg[22]),
        .I1(window_done),
        .O(\edge_cnt[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[20]_i_4 
       (.I0(edge_cnt_reg[21]),
        .I1(window_done),
        .O(\edge_cnt[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[20]_i_5 
       (.I0(edge_cnt_reg[20]),
        .I1(window_done),
        .O(\edge_cnt[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[24]_i_2 
       (.I0(edge_cnt_reg[27]),
        .I1(window_done),
        .O(\edge_cnt[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[24]_i_3 
       (.I0(edge_cnt_reg[26]),
        .I1(window_done),
        .O(\edge_cnt[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[24]_i_4 
       (.I0(edge_cnt_reg[25]),
        .I1(window_done),
        .O(\edge_cnt[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[24]_i_5 
       (.I0(edge_cnt_reg[24]),
        .I1(window_done),
        .O(\edge_cnt[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[28]_i_2 
       (.I0(edge_cnt_reg[31]),
        .I1(window_done),
        .O(\edge_cnt[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[28]_i_3 
       (.I0(edge_cnt_reg[30]),
        .I1(window_done),
        .O(\edge_cnt[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[28]_i_4 
       (.I0(edge_cnt_reg[29]),
        .I1(window_done),
        .O(\edge_cnt[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[28]_i_5 
       (.I0(edge_cnt_reg[28]),
        .I1(window_done),
        .O(\edge_cnt[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[4]_i_2 
       (.I0(edge_cnt_reg[7]),
        .I1(window_done),
        .O(\edge_cnt[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[4]_i_3 
       (.I0(edge_cnt_reg[6]),
        .I1(window_done),
        .O(\edge_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[4]_i_4 
       (.I0(edge_cnt_reg[5]),
        .I1(window_done),
        .O(\edge_cnt[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[4]_i_5 
       (.I0(edge_cnt_reg[4]),
        .I1(window_done),
        .O(\edge_cnt[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[8]_i_2 
       (.I0(edge_cnt_reg[11]),
        .I1(window_done),
        .O(\edge_cnt[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[8]_i_3 
       (.I0(edge_cnt_reg[10]),
        .I1(window_done),
        .O(\edge_cnt[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[8]_i_4 
       (.I0(edge_cnt_reg[9]),
        .I1(window_done),
        .O(\edge_cnt[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \edge_cnt[8]_i_5 
       (.I0(edge_cnt_reg[8]),
        .I1(window_done),
        .O(\edge_cnt[8]_i_5_n_0 ));
  FDCE \edge_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[0]_i_2_n_7 ),
        .Q(edge_cnt_reg[0]));
  CARRY4 \edge_cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\edge_cnt_reg[0]_i_2_n_0 ,\edge_cnt_reg[0]_i_2_n_1 ,\edge_cnt_reg[0]_i_2_n_2 ,\edge_cnt_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\edge_cnt[0]_i_3_n_0 }),
        .O({\edge_cnt_reg[0]_i_2_n_4 ,\edge_cnt_reg[0]_i_2_n_5 ,\edge_cnt_reg[0]_i_2_n_6 ,\edge_cnt_reg[0]_i_2_n_7 }),
        .S({\edge_cnt[0]_i_4_n_0 ,\edge_cnt[0]_i_5_n_0 ,\edge_cnt[0]_i_6_n_0 ,\edge_cnt[0]_i_7_n_0 }));
  FDCE \edge_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[8]_i_1_n_5 ),
        .Q(edge_cnt_reg[10]));
  FDCE \edge_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[8]_i_1_n_4 ),
        .Q(edge_cnt_reg[11]));
  FDCE \edge_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[12]_i_1_n_7 ),
        .Q(edge_cnt_reg[12]));
  CARRY4 \edge_cnt_reg[12]_i_1 
       (.CI(\edge_cnt_reg[8]_i_1_n_0 ),
        .CO({\edge_cnt_reg[12]_i_1_n_0 ,\edge_cnt_reg[12]_i_1_n_1 ,\edge_cnt_reg[12]_i_1_n_2 ,\edge_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\edge_cnt_reg[12]_i_1_n_4 ,\edge_cnt_reg[12]_i_1_n_5 ,\edge_cnt_reg[12]_i_1_n_6 ,\edge_cnt_reg[12]_i_1_n_7 }),
        .S({\edge_cnt[12]_i_2_n_0 ,\edge_cnt[12]_i_3_n_0 ,\edge_cnt[12]_i_4_n_0 ,\edge_cnt[12]_i_5_n_0 }));
  FDCE \edge_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[12]_i_1_n_6 ),
        .Q(edge_cnt_reg[13]));
  FDCE \edge_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[12]_i_1_n_5 ),
        .Q(edge_cnt_reg[14]));
  FDCE \edge_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[12]_i_1_n_4 ),
        .Q(edge_cnt_reg[15]));
  FDCE \edge_cnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[16]_i_1_n_7 ),
        .Q(edge_cnt_reg[16]));
  CARRY4 \edge_cnt_reg[16]_i_1 
       (.CI(\edge_cnt_reg[12]_i_1_n_0 ),
        .CO({\edge_cnt_reg[16]_i_1_n_0 ,\edge_cnt_reg[16]_i_1_n_1 ,\edge_cnt_reg[16]_i_1_n_2 ,\edge_cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\edge_cnt_reg[16]_i_1_n_4 ,\edge_cnt_reg[16]_i_1_n_5 ,\edge_cnt_reg[16]_i_1_n_6 ,\edge_cnt_reg[16]_i_1_n_7 }),
        .S({\edge_cnt[16]_i_2_n_0 ,\edge_cnt[16]_i_3_n_0 ,\edge_cnt[16]_i_4_n_0 ,\edge_cnt[16]_i_5_n_0 }));
  FDCE \edge_cnt_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[16]_i_1_n_6 ),
        .Q(edge_cnt_reg[17]));
  FDCE \edge_cnt_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[16]_i_1_n_5 ),
        .Q(edge_cnt_reg[18]));
  FDCE \edge_cnt_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[16]_i_1_n_4 ),
        .Q(edge_cnt_reg[19]));
  FDCE \edge_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[0]_i_2_n_6 ),
        .Q(edge_cnt_reg[1]));
  FDCE \edge_cnt_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[20]_i_1_n_7 ),
        .Q(edge_cnt_reg[20]));
  CARRY4 \edge_cnt_reg[20]_i_1 
       (.CI(\edge_cnt_reg[16]_i_1_n_0 ),
        .CO({\edge_cnt_reg[20]_i_1_n_0 ,\edge_cnt_reg[20]_i_1_n_1 ,\edge_cnt_reg[20]_i_1_n_2 ,\edge_cnt_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\edge_cnt_reg[20]_i_1_n_4 ,\edge_cnt_reg[20]_i_1_n_5 ,\edge_cnt_reg[20]_i_1_n_6 ,\edge_cnt_reg[20]_i_1_n_7 }),
        .S({\edge_cnt[20]_i_2_n_0 ,\edge_cnt[20]_i_3_n_0 ,\edge_cnt[20]_i_4_n_0 ,\edge_cnt[20]_i_5_n_0 }));
  FDCE \edge_cnt_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[20]_i_1_n_6 ),
        .Q(edge_cnt_reg[21]));
  FDCE \edge_cnt_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[20]_i_1_n_5 ),
        .Q(edge_cnt_reg[22]));
  FDCE \edge_cnt_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[20]_i_1_n_4 ),
        .Q(edge_cnt_reg[23]));
  FDCE \edge_cnt_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[24]_i_1_n_7 ),
        .Q(edge_cnt_reg[24]));
  CARRY4 \edge_cnt_reg[24]_i_1 
       (.CI(\edge_cnt_reg[20]_i_1_n_0 ),
        .CO({\edge_cnt_reg[24]_i_1_n_0 ,\edge_cnt_reg[24]_i_1_n_1 ,\edge_cnt_reg[24]_i_1_n_2 ,\edge_cnt_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\edge_cnt_reg[24]_i_1_n_4 ,\edge_cnt_reg[24]_i_1_n_5 ,\edge_cnt_reg[24]_i_1_n_6 ,\edge_cnt_reg[24]_i_1_n_7 }),
        .S({\edge_cnt[24]_i_2_n_0 ,\edge_cnt[24]_i_3_n_0 ,\edge_cnt[24]_i_4_n_0 ,\edge_cnt[24]_i_5_n_0 }));
  FDCE \edge_cnt_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[24]_i_1_n_6 ),
        .Q(edge_cnt_reg[25]));
  FDCE \edge_cnt_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[24]_i_1_n_5 ),
        .Q(edge_cnt_reg[26]));
  FDCE \edge_cnt_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[24]_i_1_n_4 ),
        .Q(edge_cnt_reg[27]));
  FDCE \edge_cnt_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[28]_i_1_n_7 ),
        .Q(edge_cnt_reg[28]));
  CARRY4 \edge_cnt_reg[28]_i_1 
       (.CI(\edge_cnt_reg[24]_i_1_n_0 ),
        .CO({\NLW_edge_cnt_reg[28]_i_1_CO_UNCONNECTED [3],\edge_cnt_reg[28]_i_1_n_1 ,\edge_cnt_reg[28]_i_1_n_2 ,\edge_cnt_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\edge_cnt_reg[28]_i_1_n_4 ,\edge_cnt_reg[28]_i_1_n_5 ,\edge_cnt_reg[28]_i_1_n_6 ,\edge_cnt_reg[28]_i_1_n_7 }),
        .S({\edge_cnt[28]_i_2_n_0 ,\edge_cnt[28]_i_3_n_0 ,\edge_cnt[28]_i_4_n_0 ,\edge_cnt[28]_i_5_n_0 }));
  FDCE \edge_cnt_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[28]_i_1_n_6 ),
        .Q(edge_cnt_reg[29]));
  FDCE \edge_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[0]_i_2_n_5 ),
        .Q(edge_cnt_reg[2]));
  FDCE \edge_cnt_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[28]_i_1_n_5 ),
        .Q(edge_cnt_reg[30]));
  FDCE \edge_cnt_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[28]_i_1_n_4 ),
        .Q(edge_cnt_reg[31]));
  FDCE \edge_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[0]_i_2_n_4 ),
        .Q(edge_cnt_reg[3]));
  FDCE \edge_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[4]_i_1_n_7 ),
        .Q(edge_cnt_reg[4]));
  CARRY4 \edge_cnt_reg[4]_i_1 
       (.CI(\edge_cnt_reg[0]_i_2_n_0 ),
        .CO({\edge_cnt_reg[4]_i_1_n_0 ,\edge_cnt_reg[4]_i_1_n_1 ,\edge_cnt_reg[4]_i_1_n_2 ,\edge_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\edge_cnt_reg[4]_i_1_n_4 ,\edge_cnt_reg[4]_i_1_n_5 ,\edge_cnt_reg[4]_i_1_n_6 ,\edge_cnt_reg[4]_i_1_n_7 }),
        .S({\edge_cnt[4]_i_2_n_0 ,\edge_cnt[4]_i_3_n_0 ,\edge_cnt[4]_i_4_n_0 ,\edge_cnt[4]_i_5_n_0 }));
  FDCE \edge_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[4]_i_1_n_6 ),
        .Q(edge_cnt_reg[5]));
  FDCE \edge_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[4]_i_1_n_5 ),
        .Q(edge_cnt_reg[6]));
  FDCE \edge_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[4]_i_1_n_4 ),
        .Q(edge_cnt_reg[7]));
  FDCE \edge_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[8]_i_1_n_7 ),
        .Q(edge_cnt_reg[8]));
  CARRY4 \edge_cnt_reg[8]_i_1 
       (.CI(\edge_cnt_reg[4]_i_1_n_0 ),
        .CO({\edge_cnt_reg[8]_i_1_n_0 ,\edge_cnt_reg[8]_i_1_n_1 ,\edge_cnt_reg[8]_i_1_n_2 ,\edge_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\edge_cnt_reg[8]_i_1_n_4 ,\edge_cnt_reg[8]_i_1_n_5 ,\edge_cnt_reg[8]_i_1_n_6 ,\edge_cnt_reg[8]_i_1_n_7 }),
        .S({\edge_cnt[8]_i_2_n_0 ,\edge_cnt[8]_i_3_n_0 ,\edge_cnt[8]_i_4_n_0 ,\edge_cnt[8]_i_5_n_0 }));
  FDCE \edge_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\edge_cnt[0]_i_1_n_0 ),
        .CLR(s00_axi_aresetn_0),
        .D(\edge_cnt_reg[8]_i_1_n_6 ),
        .Q(edge_cnt_reg[9]));
  FDCE \freq_count_reg[0] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[0]),
        .Q(freq_count[0]));
  FDCE \freq_count_reg[10] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[10]),
        .Q(freq_count[10]));
  FDCE \freq_count_reg[11] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[11]),
        .Q(freq_count[11]));
  FDCE \freq_count_reg[12] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[12]),
        .Q(freq_count[12]));
  FDCE \freq_count_reg[13] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[13]),
        .Q(freq_count[13]));
  FDCE \freq_count_reg[14] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[14]),
        .Q(freq_count[14]));
  FDCE \freq_count_reg[15] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[15]),
        .Q(freq_count[15]));
  FDCE \freq_count_reg[16] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[16]),
        .Q(freq_count[16]));
  FDCE \freq_count_reg[17] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[17]),
        .Q(freq_count[17]));
  FDCE \freq_count_reg[18] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[18]),
        .Q(freq_count[18]));
  FDCE \freq_count_reg[19] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[19]),
        .Q(freq_count[19]));
  FDCE \freq_count_reg[1] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[1]),
        .Q(freq_count[1]));
  FDCE \freq_count_reg[20] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[20]),
        .Q(freq_count[20]));
  FDCE \freq_count_reg[21] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[21]),
        .Q(freq_count[21]));
  FDCE \freq_count_reg[22] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[22]),
        .Q(freq_count[22]));
  FDCE \freq_count_reg[23] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[23]),
        .Q(freq_count[23]));
  FDCE \freq_count_reg[24] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[24]),
        .Q(freq_count[24]));
  FDCE \freq_count_reg[25] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[25]),
        .Q(freq_count[25]));
  FDCE \freq_count_reg[26] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[26]),
        .Q(freq_count[26]));
  FDCE \freq_count_reg[27] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[27]),
        .Q(freq_count[27]));
  FDCE \freq_count_reg[28] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[28]),
        .Q(freq_count[28]));
  FDCE \freq_count_reg[29] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[29]),
        .Q(freq_count[29]));
  FDCE \freq_count_reg[2] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[2]),
        .Q(freq_count[2]));
  FDCE \freq_count_reg[30] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[30]),
        .Q(freq_count[30]));
  FDCE \freq_count_reg[31] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[31]),
        .Q(freq_count[31]));
  FDCE \freq_count_reg[3] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[3]),
        .Q(freq_count[3]));
  FDCE \freq_count_reg[4] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[4]),
        .Q(freq_count[4]));
  FDCE \freq_count_reg[5] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[5]),
        .Q(freq_count[5]));
  FDCE \freq_count_reg[6] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[6]),
        .Q(freq_count[6]));
  FDCE \freq_count_reg[7] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[7]),
        .Q(freq_count[7]));
  FDCE \freq_count_reg[8] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[8]),
        .Q(freq_count[8]));
  FDCE \freq_count_reg[9] 
       (.C(s00_axi_aclk),
        .CE(window_done),
        .CLR(s00_axi_aresetn_0),
        .D(edge_cnt_reg[9]),
        .Q(freq_count[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \s00_axi_rdata[0]_INST_0 
       (.I0(Q[0]),
        .I1(\s00_axi_rdata[31] [0]),
        .I2(axi_araddr[0]),
        .I3(valid_sticky),
        .I4(axi_araddr[1]),
        .I5(freq_count[0]),
        .O(s00_axi_rdata[0]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[10]_INST_0 
       (.I0(Q[10]),
        .I1(\s00_axi_rdata[31] [10]),
        .I2(axi_araddr[0]),
        .I3(freq_count[10]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[10]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[11]_INST_0 
       (.I0(Q[11]),
        .I1(\s00_axi_rdata[31] [11]),
        .I2(axi_araddr[0]),
        .I3(freq_count[11]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[11]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[12]_INST_0 
       (.I0(Q[12]),
        .I1(\s00_axi_rdata[31] [12]),
        .I2(axi_araddr[0]),
        .I3(freq_count[12]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[12]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[13]_INST_0 
       (.I0(Q[13]),
        .I1(\s00_axi_rdata[31] [13]),
        .I2(axi_araddr[0]),
        .I3(freq_count[13]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[13]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[14]_INST_0 
       (.I0(Q[14]),
        .I1(\s00_axi_rdata[31] [14]),
        .I2(axi_araddr[0]),
        .I3(freq_count[14]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[14]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[15]_INST_0 
       (.I0(Q[15]),
        .I1(\s00_axi_rdata[31] [15]),
        .I2(axi_araddr[0]),
        .I3(freq_count[15]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[15]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[16]_INST_0 
       (.I0(Q[16]),
        .I1(\s00_axi_rdata[31] [16]),
        .I2(axi_araddr[0]),
        .I3(freq_count[16]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[16]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[17]_INST_0 
       (.I0(Q[17]),
        .I1(\s00_axi_rdata[31] [17]),
        .I2(axi_araddr[0]),
        .I3(freq_count[17]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[17]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[18]_INST_0 
       (.I0(Q[18]),
        .I1(\s00_axi_rdata[31] [18]),
        .I2(axi_araddr[0]),
        .I3(freq_count[18]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[18]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[19]_INST_0 
       (.I0(Q[19]),
        .I1(\s00_axi_rdata[31] [19]),
        .I2(axi_araddr[0]),
        .I3(freq_count[19]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[19]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[1]_INST_0 
       (.I0(Q[1]),
        .I1(\s00_axi_rdata[31] [1]),
        .I2(axi_araddr[0]),
        .I3(freq_count[1]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[1]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[20]_INST_0 
       (.I0(Q[20]),
        .I1(\s00_axi_rdata[31] [20]),
        .I2(axi_araddr[0]),
        .I3(freq_count[20]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[20]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[21]_INST_0 
       (.I0(Q[21]),
        .I1(\s00_axi_rdata[31] [21]),
        .I2(axi_araddr[0]),
        .I3(freq_count[21]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[21]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[22]_INST_0 
       (.I0(Q[22]),
        .I1(\s00_axi_rdata[31] [22]),
        .I2(axi_araddr[0]),
        .I3(freq_count[22]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[22]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[23]_INST_0 
       (.I0(Q[23]),
        .I1(\s00_axi_rdata[31] [23]),
        .I2(axi_araddr[0]),
        .I3(freq_count[23]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[23]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[24]_INST_0 
       (.I0(Q[24]),
        .I1(\s00_axi_rdata[31] [24]),
        .I2(axi_araddr[0]),
        .I3(freq_count[24]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[24]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[25]_INST_0 
       (.I0(Q[25]),
        .I1(\s00_axi_rdata[31] [25]),
        .I2(axi_araddr[0]),
        .I3(freq_count[25]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[25]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[26]_INST_0 
       (.I0(Q[26]),
        .I1(\s00_axi_rdata[31] [26]),
        .I2(axi_araddr[0]),
        .I3(freq_count[26]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[26]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[27]_INST_0 
       (.I0(Q[27]),
        .I1(\s00_axi_rdata[31] [27]),
        .I2(axi_araddr[0]),
        .I3(freq_count[27]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[27]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[28]_INST_0 
       (.I0(Q[28]),
        .I1(\s00_axi_rdata[31] [28]),
        .I2(axi_araddr[0]),
        .I3(freq_count[28]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[28]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[29]_INST_0 
       (.I0(Q[29]),
        .I1(\s00_axi_rdata[31] [29]),
        .I2(axi_araddr[0]),
        .I3(freq_count[29]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[29]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[2]_INST_0 
       (.I0(Q[2]),
        .I1(\s00_axi_rdata[31] [2]),
        .I2(axi_araddr[0]),
        .I3(freq_count[2]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[2]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[30]_INST_0 
       (.I0(Q[30]),
        .I1(\s00_axi_rdata[31] [30]),
        .I2(axi_araddr[0]),
        .I3(freq_count[30]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[30]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[31]_INST_0 
       (.I0(Q[31]),
        .I1(\s00_axi_rdata[31] [31]),
        .I2(axi_araddr[0]),
        .I3(freq_count[31]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[31]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[3]_INST_0 
       (.I0(Q[3]),
        .I1(\s00_axi_rdata[31] [3]),
        .I2(axi_araddr[0]),
        .I3(freq_count[3]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[3]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[4]_INST_0 
       (.I0(Q[4]),
        .I1(\s00_axi_rdata[31] [4]),
        .I2(axi_araddr[0]),
        .I3(freq_count[4]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[4]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[5]_INST_0 
       (.I0(Q[5]),
        .I1(\s00_axi_rdata[31] [5]),
        .I2(axi_araddr[0]),
        .I3(freq_count[5]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[5]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[6]_INST_0 
       (.I0(Q[6]),
        .I1(\s00_axi_rdata[31] [6]),
        .I2(axi_araddr[0]),
        .I3(freq_count[6]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[6]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[7]_INST_0 
       (.I0(Q[7]),
        .I1(\s00_axi_rdata[31] [7]),
        .I2(axi_araddr[0]),
        .I3(freq_count[7]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[7]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[8]_INST_0 
       (.I0(Q[8]),
        .I1(\s00_axi_rdata[31] [8]),
        .I2(axi_araddr[0]),
        .I3(freq_count[8]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[8]));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \s00_axi_rdata[9]_INST_0 
       (.I0(Q[9]),
        .I1(\s00_axi_rdata[31] [9]),
        .I2(axi_araddr[0]),
        .I3(freq_count[9]),
        .I4(axi_araddr[1]),
        .O(s00_axi_rdata[9]));
  FDCE sync_ff1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(led_osc),
        .Q(sync_ff1));
  FDCE sync_ff2_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(sync_ff1),
        .Q(sync_ff2));
  FDCE sync_ff3_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(sync_ff2),
        .Q(sync_ff3));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    valid_i_1
       (.I0(valid_i_2_n_0),
        .I1(window_cnt_reg[14]),
        .I2(window_cnt_reg[13]),
        .I3(window_cnt_reg[12]),
        .I4(window_cnt_reg[11]),
        .I5(valid_i_3_n_0),
        .O(window_done));
  LUT4 #(
    .INIT(16'hFFFB)) 
    valid_i_2
       (.I0(window_cnt_reg[5]),
        .I1(window_cnt_reg[15]),
        .I2(window_cnt_reg[8]),
        .I3(window_cnt_reg[6]),
        .O(valid_i_2_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    valid_i_3
       (.I0(valid_i_4_n_0),
        .I1(window_cnt_reg[10]),
        .I2(window_cnt_reg[16]),
        .I3(window_cnt_reg[7]),
        .I4(window_cnt_reg[9]),
        .O(valid_i_3_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    valid_i_4
       (.I0(window_cnt_reg[0]),
        .I1(window_cnt_reg[1]),
        .I2(window_cnt_reg[2]),
        .I3(window_cnt_reg[4]),
        .I4(window_cnt_reg[3]),
        .O(valid_i_4_n_0));
  FDCE valid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(window_done),
        .Q(freq_valid));
  LUT6 #(
    .INIT(64'hFFFFBFFFAAAAAAAA)) 
    valid_sticky_i_1
       (.I0(freq_valid),
        .I1(s00_axi_arvalid),
        .I2(valid_sticky_reg),
        .I3(s00_axi_araddr[1]),
        .I4(s00_axi_araddr[0]),
        .I5(valid_sticky),
        .O(valid_reg_0));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[0]_i_2 
       (.I0(window_cnt_reg[0]),
        .I1(window_done),
        .O(\window_cnt[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[0]_i_3 
       (.I0(window_cnt_reg[3]),
        .I1(window_done),
        .O(\window_cnt[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[0]_i_4 
       (.I0(window_cnt_reg[2]),
        .I1(window_done),
        .O(\window_cnt[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[0]_i_5 
       (.I0(window_cnt_reg[1]),
        .I1(window_done),
        .O(\window_cnt[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \window_cnt[0]_i_6 
       (.I0(window_cnt_reg[0]),
        .I1(window_done),
        .O(\window_cnt[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[12]_i_2 
       (.I0(window_cnt_reg[15]),
        .I1(window_done),
        .O(\window_cnt[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[12]_i_3 
       (.I0(window_cnt_reg[14]),
        .I1(window_done),
        .O(\window_cnt[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[12]_i_4 
       (.I0(window_cnt_reg[13]),
        .I1(window_done),
        .O(\window_cnt[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[12]_i_5 
       (.I0(window_cnt_reg[12]),
        .I1(window_done),
        .O(\window_cnt[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[16]_i_2 
       (.I0(window_cnt_reg[16]),
        .I1(window_done),
        .O(\window_cnt[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[4]_i_2 
       (.I0(window_cnt_reg[7]),
        .I1(window_done),
        .O(\window_cnt[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[4]_i_3 
       (.I0(window_cnt_reg[6]),
        .I1(window_done),
        .O(\window_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[4]_i_4 
       (.I0(window_cnt_reg[5]),
        .I1(window_done),
        .O(\window_cnt[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[4]_i_5 
       (.I0(window_cnt_reg[4]),
        .I1(window_done),
        .O(\window_cnt[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[8]_i_2 
       (.I0(window_cnt_reg[11]),
        .I1(window_done),
        .O(\window_cnt[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[8]_i_3 
       (.I0(window_cnt_reg[10]),
        .I1(window_done),
        .O(\window_cnt[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[8]_i_4 
       (.I0(window_cnt_reg[9]),
        .I1(window_done),
        .O(\window_cnt[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \window_cnt[8]_i_5 
       (.I0(window_cnt_reg[8]),
        .I1(window_done),
        .O(\window_cnt[8]_i_5_n_0 ));
  FDCE \window_cnt_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[0]_i_1_n_7 ),
        .Q(window_cnt_reg[0]));
  CARRY4 \window_cnt_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\window_cnt_reg[0]_i_1_n_0 ,\window_cnt_reg[0]_i_1_n_1 ,\window_cnt_reg[0]_i_1_n_2 ,\window_cnt_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\window_cnt[0]_i_2_n_0 }),
        .O({\window_cnt_reg[0]_i_1_n_4 ,\window_cnt_reg[0]_i_1_n_5 ,\window_cnt_reg[0]_i_1_n_6 ,\window_cnt_reg[0]_i_1_n_7 }),
        .S({\window_cnt[0]_i_3_n_0 ,\window_cnt[0]_i_4_n_0 ,\window_cnt[0]_i_5_n_0 ,\window_cnt[0]_i_6_n_0 }));
  FDCE \window_cnt_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[8]_i_1_n_5 ),
        .Q(window_cnt_reg[10]));
  FDCE \window_cnt_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[8]_i_1_n_4 ),
        .Q(window_cnt_reg[11]));
  FDCE \window_cnt_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[12]_i_1_n_7 ),
        .Q(window_cnt_reg[12]));
  CARRY4 \window_cnt_reg[12]_i_1 
       (.CI(\window_cnt_reg[8]_i_1_n_0 ),
        .CO({\window_cnt_reg[12]_i_1_n_0 ,\window_cnt_reg[12]_i_1_n_1 ,\window_cnt_reg[12]_i_1_n_2 ,\window_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\window_cnt_reg[12]_i_1_n_4 ,\window_cnt_reg[12]_i_1_n_5 ,\window_cnt_reg[12]_i_1_n_6 ,\window_cnt_reg[12]_i_1_n_7 }),
        .S({\window_cnt[12]_i_2_n_0 ,\window_cnt[12]_i_3_n_0 ,\window_cnt[12]_i_4_n_0 ,\window_cnt[12]_i_5_n_0 }));
  FDCE \window_cnt_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[12]_i_1_n_6 ),
        .Q(window_cnt_reg[13]));
  FDCE \window_cnt_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[12]_i_1_n_5 ),
        .Q(window_cnt_reg[14]));
  FDCE \window_cnt_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[12]_i_1_n_4 ),
        .Q(window_cnt_reg[15]));
  FDCE \window_cnt_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[16]_i_1_n_7 ),
        .Q(window_cnt_reg[16]));
  CARRY4 \window_cnt_reg[16]_i_1 
       (.CI(\window_cnt_reg[12]_i_1_n_0 ),
        .CO(\NLW_window_cnt_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_window_cnt_reg[16]_i_1_O_UNCONNECTED [3:1],\window_cnt_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,\window_cnt[16]_i_2_n_0 }));
  FDCE \window_cnt_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[0]_i_1_n_6 ),
        .Q(window_cnt_reg[1]));
  FDCE \window_cnt_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[0]_i_1_n_5 ),
        .Q(window_cnt_reg[2]));
  FDCE \window_cnt_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[0]_i_1_n_4 ),
        .Q(window_cnt_reg[3]));
  FDCE \window_cnt_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[4]_i_1_n_7 ),
        .Q(window_cnt_reg[4]));
  CARRY4 \window_cnt_reg[4]_i_1 
       (.CI(\window_cnt_reg[0]_i_1_n_0 ),
        .CO({\window_cnt_reg[4]_i_1_n_0 ,\window_cnt_reg[4]_i_1_n_1 ,\window_cnt_reg[4]_i_1_n_2 ,\window_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\window_cnt_reg[4]_i_1_n_4 ,\window_cnt_reg[4]_i_1_n_5 ,\window_cnt_reg[4]_i_1_n_6 ,\window_cnt_reg[4]_i_1_n_7 }),
        .S({\window_cnt[4]_i_2_n_0 ,\window_cnt[4]_i_3_n_0 ,\window_cnt[4]_i_4_n_0 ,\window_cnt[4]_i_5_n_0 }));
  FDCE \window_cnt_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[4]_i_1_n_6 ),
        .Q(window_cnt_reg[5]));
  FDCE \window_cnt_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[4]_i_1_n_5 ),
        .Q(window_cnt_reg[6]));
  FDCE \window_cnt_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[4]_i_1_n_4 ),
        .Q(window_cnt_reg[7]));
  FDCE \window_cnt_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[8]_i_1_n_7 ),
        .Q(window_cnt_reg[8]));
  CARRY4 \window_cnt_reg[8]_i_1 
       (.CI(\window_cnt_reg[4]_i_1_n_0 ),
        .CO({\window_cnt_reg[8]_i_1_n_0 ,\window_cnt_reg[8]_i_1_n_1 ,\window_cnt_reg[8]_i_1_n_2 ,\window_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\window_cnt_reg[8]_i_1_n_4 ,\window_cnt_reg[8]_i_1_n_5 ,\window_cnt_reg[8]_i_1_n_6 ,\window_cnt_reg[8]_i_1_n_7 }),
        .S({\window_cnt[8]_i_2_n_0 ,\window_cnt[8]_i_3_n_0 ,\window_cnt[8]_i_4_n_0 ,\window_cnt[8]_i_5_n_0 }));
  FDCE \window_cnt_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(\window_cnt_reg[8]_i_1_n_6 ),
        .Q(window_cnt_reg[9]));
endmodule

(* ORIG_REF_NAME = "freq_counter_axi" *) 
module system_osc_axi_system_0_0_freq_counter_axi
   (SR,
    axi_awready_reg_0,
    axi_wready_reg_0,
    axi_arready_reg_0,
    s00_axi_bvalid,
    s00_axi_rvalid,
    CLK,
    in0,
    \reg_control_reg[2]_0 ,
    s00_axi_rdata,
    Q,
    led_osc,
    s00_axi_aclk,
    out,
    S,
    \gen_carry[0].carry_stage ,
    \gen_inv[0].inv_stage ,
    pmod_in,
    \cnt_reg[0] ,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_rready,
    s00_axi_awaddr,
    s00_axi_wdata);
  output [0:0]SR;
  output axi_awready_reg_0;
  output axi_wready_reg_0;
  output axi_arready_reg_0;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output CLK;
  output in0;
  output \reg_control_reg[2]_0 ;
  output [31:0]s00_axi_rdata;
  output [5:0]Q;
  input led_osc;
  input s00_axi_aclk;
  input out;
  input [0:0]S;
  input \gen_carry[0].carry_stage ;
  input \gen_inv[0].inv_stage ;
  input pmod_in;
  input [0:0]\cnt_reg[0] ;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_bready;
  input [1:0]s00_axi_araddr;
  input s00_axi_rready;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;

  wire CLK;
  wire [5:0]Q;
  wire [0:0]S;
  wire [0:0]SR;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire axi_arready_reg_0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_reg_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire axi_wready_reg_0;
  wire \cnt[7]_i_4_n_0 ;
  wire [0:0]\cnt_reg[0] ;
  wire \gen_carry[0].carry_stage ;
  wire \gen_inv[0].inv_stage ;
  wire in0;
  wire inst_fc_n_33;
  wire led_osc;
  wire osc_enable;
  wire [1:0]osc_select;
  wire out;
  wire [1:0]p_0_in;
  wire pmod_in;
  wire [31:3]reg_control;
  wire reg_control_1;
  wire \reg_control_reg[2]_0 ;
  wire [31:6]reg_tap;
  wire reg_tap_0;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wvalid;
  wire valid_sticky;

  LUT5 #(
    .INIT(32'hFBFF0800)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_aresetn),
        .I2(axi_arready_reg_0),
        .I3(s00_axi_arvalid),
        .I4(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFBFF0800)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_aresetn),
        .I2(axi_arready_reg_0),
        .I3(s00_axi_arvalid),
        .I4(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(1'b0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(axi_arready_reg_0),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awvalid),
        .I3(axi_awready_reg_0),
        .I4(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awvalid),
        .I3(axi_awready_reg_0),
        .I4(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(1'b0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .I2(axi_awready_reg_0),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(axi_awready_reg_0),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .I2(axi_awready_reg_0),
        .I3(axi_wready_reg_0),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arvalid),
        .I1(axi_arready_reg_0),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_wready_i_1
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awvalid),
        .I2(axi_wready_reg_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(axi_wready_reg_0),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFFFFF080F0800)) 
    \cnt[7]_i_2 
       (.I0(out),
        .I1(osc_enable),
        .I2(osc_select[1]),
        .I3(osc_select[0]),
        .I4(S),
        .I5(\cnt[7]_i_4_n_0 ),
        .O(CLK));
  LUT5 #(
    .INIT(32'hE0202020)) 
    \cnt[7]_i_4 
       (.I0(pmod_in),
        .I1(osc_select[0]),
        .I2(osc_select[1]),
        .I3(osc_enable),
        .I4(\cnt_reg[0] ),
        .O(\cnt[7]_i_4_n_0 ));
  system_osc_axi_system_0_0_freq_counter inst_fc
       (.Q({reg_tap,Q}),
        .axi_araddr(axi_araddr),
        .led_osc(led_osc),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_aresetn_0(SR),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .\s00_axi_rdata[31] ({reg_control,osc_enable,osc_select}),
        .valid_reg_0(inst_fc_n_33),
        .valid_sticky(valid_sticky),
        .valid_sticky_reg(axi_arready_reg_0));
  LUT2 #(
    .INIT(4'h8)) 
    loop_in_inferred_i_1
       (.I0(osc_enable),
        .I1(\gen_carry[0].carry_stage ),
        .O(in0));
  LUT2 #(
    .INIT(4'h8)) 
    loop_in_inferred_i_1__0
       (.I0(osc_enable),
        .I1(\gen_inv[0].inv_stage ),
        .O(\reg_control_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \reg_control[31]_i_1 
       (.I0(axi_wready_reg_0),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(reg_control_1));
  FDRE \reg_control_reg[0] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[0]),
        .Q(osc_select[0]),
        .R(SR));
  FDRE \reg_control_reg[10] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[10]),
        .Q(reg_control[10]),
        .R(SR));
  FDRE \reg_control_reg[11] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[11]),
        .Q(reg_control[11]),
        .R(SR));
  FDRE \reg_control_reg[12] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[12]),
        .Q(reg_control[12]),
        .R(SR));
  FDRE \reg_control_reg[13] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[13]),
        .Q(reg_control[13]),
        .R(SR));
  FDRE \reg_control_reg[14] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[14]),
        .Q(reg_control[14]),
        .R(SR));
  FDRE \reg_control_reg[15] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[15]),
        .Q(reg_control[15]),
        .R(SR));
  FDRE \reg_control_reg[16] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[16]),
        .Q(reg_control[16]),
        .R(SR));
  FDRE \reg_control_reg[17] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[17]),
        .Q(reg_control[17]),
        .R(SR));
  FDRE \reg_control_reg[18] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[18]),
        .Q(reg_control[18]),
        .R(SR));
  FDRE \reg_control_reg[19] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[19]),
        .Q(reg_control[19]),
        .R(SR));
  FDRE \reg_control_reg[1] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[1]),
        .Q(osc_select[1]),
        .R(SR));
  FDRE \reg_control_reg[20] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[20]),
        .Q(reg_control[20]),
        .R(SR));
  FDRE \reg_control_reg[21] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[21]),
        .Q(reg_control[21]),
        .R(SR));
  FDRE \reg_control_reg[22] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[22]),
        .Q(reg_control[22]),
        .R(SR));
  FDRE \reg_control_reg[23] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[23]),
        .Q(reg_control[23]),
        .R(SR));
  FDRE \reg_control_reg[24] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[24]),
        .Q(reg_control[24]),
        .R(SR));
  FDRE \reg_control_reg[25] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[25]),
        .Q(reg_control[25]),
        .R(SR));
  FDRE \reg_control_reg[26] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[26]),
        .Q(reg_control[26]),
        .R(SR));
  FDRE \reg_control_reg[27] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[27]),
        .Q(reg_control[27]),
        .R(SR));
  FDRE \reg_control_reg[28] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[28]),
        .Q(reg_control[28]),
        .R(SR));
  FDRE \reg_control_reg[29] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[29]),
        .Q(reg_control[29]),
        .R(SR));
  FDRE \reg_control_reg[2] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[2]),
        .Q(osc_enable),
        .R(SR));
  FDRE \reg_control_reg[30] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[30]),
        .Q(reg_control[30]),
        .R(SR));
  FDRE \reg_control_reg[31] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[31]),
        .Q(reg_control[31]),
        .R(SR));
  FDRE \reg_control_reg[3] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[3]),
        .Q(reg_control[3]),
        .R(SR));
  FDRE \reg_control_reg[4] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[4]),
        .Q(reg_control[4]),
        .R(SR));
  FDRE \reg_control_reg[5] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[5]),
        .Q(reg_control[5]),
        .R(SR));
  FDRE \reg_control_reg[6] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[6]),
        .Q(reg_control[6]),
        .R(SR));
  FDRE \reg_control_reg[7] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[7]),
        .Q(reg_control[7]),
        .R(SR));
  FDRE \reg_control_reg[8] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[8]),
        .Q(reg_control[8]),
        .R(SR));
  FDRE \reg_control_reg[9] 
       (.C(s00_axi_aclk),
        .CE(reg_control_1),
        .D(s00_axi_wdata[9]),
        .Q(reg_control[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \reg_tap[31]_i_1 
       (.I0(axi_wready_reg_0),
        .I1(axi_awready_reg_0),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(reg_tap_0));
  FDSE \reg_tap_reg[0] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[0]),
        .Q(Q[0]),
        .S(SR));
  FDRE \reg_tap_reg[10] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[10]),
        .Q(reg_tap[10]),
        .R(SR));
  FDRE \reg_tap_reg[11] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[11]),
        .Q(reg_tap[11]),
        .R(SR));
  FDRE \reg_tap_reg[12] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[12]),
        .Q(reg_tap[12]),
        .R(SR));
  FDRE \reg_tap_reg[13] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[13]),
        .Q(reg_tap[13]),
        .R(SR));
  FDRE \reg_tap_reg[14] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[14]),
        .Q(reg_tap[14]),
        .R(SR));
  FDRE \reg_tap_reg[15] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[15]),
        .Q(reg_tap[15]),
        .R(SR));
  FDRE \reg_tap_reg[16] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[16]),
        .Q(reg_tap[16]),
        .R(SR));
  FDRE \reg_tap_reg[17] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[17]),
        .Q(reg_tap[17]),
        .R(SR));
  FDRE \reg_tap_reg[18] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[18]),
        .Q(reg_tap[18]),
        .R(SR));
  FDRE \reg_tap_reg[19] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[19]),
        .Q(reg_tap[19]),
        .R(SR));
  FDSE \reg_tap_reg[1] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[1]),
        .Q(Q[1]),
        .S(SR));
  FDRE \reg_tap_reg[20] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[20]),
        .Q(reg_tap[20]),
        .R(SR));
  FDRE \reg_tap_reg[21] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[21]),
        .Q(reg_tap[21]),
        .R(SR));
  FDRE \reg_tap_reg[22] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[22]),
        .Q(reg_tap[22]),
        .R(SR));
  FDRE \reg_tap_reg[23] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[23]),
        .Q(reg_tap[23]),
        .R(SR));
  FDRE \reg_tap_reg[24] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[24]),
        .Q(reg_tap[24]),
        .R(SR));
  FDRE \reg_tap_reg[25] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[25]),
        .Q(reg_tap[25]),
        .R(SR));
  FDRE \reg_tap_reg[26] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[26]),
        .Q(reg_tap[26]),
        .R(SR));
  FDRE \reg_tap_reg[27] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[27]),
        .Q(reg_tap[27]),
        .R(SR));
  FDRE \reg_tap_reg[28] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[28]),
        .Q(reg_tap[28]),
        .R(SR));
  FDRE \reg_tap_reg[29] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[29]),
        .Q(reg_tap[29]),
        .R(SR));
  FDSE \reg_tap_reg[2] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[2]),
        .Q(Q[2]),
        .S(SR));
  FDRE \reg_tap_reg[30] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[30]),
        .Q(reg_tap[30]),
        .R(SR));
  FDRE \reg_tap_reg[31] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[31]),
        .Q(reg_tap[31]),
        .R(SR));
  FDSE \reg_tap_reg[3] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[3]),
        .Q(Q[3]),
        .S(SR));
  FDSE \reg_tap_reg[4] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[4]),
        .Q(Q[4]),
        .S(SR));
  FDSE \reg_tap_reg[5] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[5]),
        .Q(Q[5]),
        .S(SR));
  FDRE \reg_tap_reg[6] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[6]),
        .Q(reg_tap[6]),
        .R(SR));
  FDRE \reg_tap_reg[7] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[7]),
        .Q(reg_tap[7]),
        .R(SR));
  FDRE \reg_tap_reg[8] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[8]),
        .Q(reg_tap[8]),
        .R(SR));
  FDRE \reg_tap_reg[9] 
       (.C(s00_axi_aclk),
        .CE(reg_tap_0),
        .D(s00_axi_wdata[9]),
        .Q(reg_tap[9]),
        .R(SR));
  FDRE valid_sticky_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(inst_fc_n_33),
        .Q(valid_sticky),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "osc_axi_system" *) 
module system_osc_axi_system_0_0_osc_axi_system
   (led_osc,
    s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_rvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_araddr,
    s00_axi_aresetn,
    s00_axi_arvalid,
    pmod_in,
    s00_axi_bready,
    s00_axi_rready);
  output led_osc;
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input s00_axi_aresetn;
  input s00_axi_arvalid;
  input pmod_in;
  input s00_axi_bready;
  input s00_axi_rready;

  wire in00;
  wire in00_0;
  wire inst_axi_n_0;
  wire led_osc;
  wire osc_selected;
  wire osc_sync;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in0_in_1;
  wire p_0_in_2;
  wire pmod_in;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire [5:0]tap_select;

  system_osc_axi_system_0_0_freq_counter_axi inst_axi
       (.CLK(osc_selected),
        .Q(tap_select),
        .S(osc_sync),
        .SR(inst_axi_n_0),
        .axi_arready_reg_0(s00_axi_arready),
        .axi_awready_reg_0(s00_axi_awready),
        .axi_wready_reg_0(s00_axi_wready),
        .\cnt_reg[0] (p_0_in_2),
        .\gen_carry[0].carry_stage (p_0_in0_in),
        .\gen_inv[0].inv_stage (p_0_in0_in_1),
        .in0(in00_0),
        .led_osc(led_osc),
        .out(p_0_in),
        .pmod_in(pmod_in),
        .\reg_control_reg[2]_0 (in00),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wvalid(s00_axi_wvalid));
  system_osc_axi_system_0_0_async_ro_carry inst_carry
       (.Q(tap_select),
        .in0(in00_0),
        .out(p_0_in),
        .\reg_tap_reg[5] (p_0_in0_in));
  system_osc_axi_system_0_0_async_ro_lut inst_lut
       (.\gen_inv[13].inv_stage_0 (p_0_in0_in_1),
        .\gen_inv[1].inv_stage_0 (in00),
        .out(p_0_in_2));
  system_osc_axi_system_0_0_async_prescaler inst_presc
       (.CLK(osc_selected),
        .SR(inst_axi_n_0),
        .led_osc(led_osc));
  system_osc_axi_system_0_0_sync_baseline inst_sync
       (.S(osc_sync),
        .SR(inst_axi_n_0),
        .s00_axi_aclk(s00_axi_aclk));
endmodule

(* ORIG_REF_NAME = "sync_baseline" *) 
module system_osc_axi_system_0_0_sync_baseline
   (S,
    s00_axi_aclk,
    SR);
  output [0:0]S;
  input s00_axi_aclk;
  input [0:0]SR;

  wire [0:0]S;
  wire [0:0]SR;
  wire \counter[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_1_n_0 ;
  wire \counter_reg[0]_i_1_n_1 ;
  wire \counter_reg[0]_i_1_n_2 ;
  wire \counter_reg[0]_i_1_n_3 ;
  wire \counter_reg[0]_i_1_n_4 ;
  wire \counter_reg[0]_i_1_n_5 ;
  wire \counter_reg[0]_i_1_n_6 ;
  wire \counter_reg[0]_i_1_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[10] ;
  wire \counter_reg_n_0_[11] ;
  wire \counter_reg_n_0_[12] ;
  wire \counter_reg_n_0_[13] ;
  wire \counter_reg_n_0_[14] ;
  wire \counter_reg_n_0_[15] ;
  wire \counter_reg_n_0_[16] ;
  wire \counter_reg_n_0_[17] ;
  wire \counter_reg_n_0_[18] ;
  wire \counter_reg_n_0_[19] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[20] ;
  wire \counter_reg_n_0_[21] ;
  wire \counter_reg_n_0_[22] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire \counter_reg_n_0_[7] ;
  wire \counter_reg_n_0_[8] ;
  wire \counter_reg_n_0_[9] ;
  wire s00_axi_aclk;
  wire [3:3]\NLW_counter_reg[20]_i_1_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_2 
       (.I0(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_2_n_0 ));
  FDCE \counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[0]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[0] ));
  CARRY4 \counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_1_n_0 ,\counter_reg[0]_i_1_n_1 ,\counter_reg[0]_i_1_n_2 ,\counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_1_n_4 ,\counter_reg[0]_i_1_n_5 ,\counter_reg[0]_i_1_n_6 ,\counter_reg[0]_i_1_n_7 }),
        .S({\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] ,\counter[0]_i_2_n_0 }));
  FDCE \counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[10] ));
  FDCE \counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[11] ));
  FDCE \counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[12] ));
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S({\counter_reg_n_0_[15] ,\counter_reg_n_0_[14] ,\counter_reg_n_0_[13] ,\counter_reg_n_0_[12] }));
  FDCE \counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[13] ));
  FDCE \counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[14] ));
  FDCE \counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[15] ));
  FDCE \counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[16] ));
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S({\counter_reg_n_0_[19] ,\counter_reg_n_0_[18] ,\counter_reg_n_0_[17] ,\counter_reg_n_0_[16] }));
  FDCE \counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[17] ));
  FDCE \counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[18] ));
  FDCE \counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[19] ));
  FDCE \counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[0]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[1] ));
  FDCE \counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[20] ));
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\NLW_counter_reg[20]_i_1_CO_UNCONNECTED [3],\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S({S,\counter_reg_n_0_[22] ,\counter_reg_n_0_[21] ,\counter_reg_n_0_[20] }));
  FDCE \counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[21] ));
  FDCE \counter_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[22] ));
  FDCE \counter_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(S));
  FDCE \counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[0]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[2] ));
  FDCE \counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[0]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[3] ));
  FDCE \counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[4] ));
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_1_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S({\counter_reg_n_0_[7] ,\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] ,\counter_reg_n_0_[4] }));
  FDCE \counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[5] ));
  FDCE \counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[6] ));
  FDCE \counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[7] ));
  FDCE \counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[8] ));
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S({\counter_reg_n_0_[11] ,\counter_reg_n_0_[10] ,\counter_reg_n_0_[9] ,\counter_reg_n_0_[8] }));
  FDCE \counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(SR),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[9] ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
