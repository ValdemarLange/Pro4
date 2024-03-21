// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Mar 21 13:01:40 2024
// Host        : madsxps running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ test_spi_slave_0_0_stub.v
// Design      : test_spi_slave_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "spi_slave,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(i_data_parallel, o_data_parallel, ck_sck, 
  ck_ss, ck_mosi, ck_miso)
/* synthesis syn_black_box black_box_pad_pin="i_data_parallel[7:0],o_data_parallel[7:0],ck_ss,ck_mosi,ck_miso" */
/* synthesis syn_force_seq_prim="ck_sck" */;
  input [7:0]i_data_parallel;
  output [7:0]o_data_parallel;
  input ck_sck /* synthesis syn_isclock = 1 */;
  input ck_ss;
  input ck_mosi;
  output ck_miso;
endmodule
