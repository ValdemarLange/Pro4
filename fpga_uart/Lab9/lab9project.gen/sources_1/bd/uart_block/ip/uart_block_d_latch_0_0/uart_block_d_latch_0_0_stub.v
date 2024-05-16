// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Wed May 15 14:40:59 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab9/lab9project.gen/sources_1/bd/uart_block/ip/uart_block_d_latch_0_0/uart_block_d_latch_0_0_stub.v
// Design      : uart_block_d_latch_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "d_latch,Vivado 2023.2.2" *)
module uart_block_d_latch_0_0(en, D, Q)
/* synthesis syn_black_box black_box_pad_pin="D[7:0],Q[7:0]" */
/* synthesis syn_force_seq_prim="en" */;
  input en /* synthesis syn_isclock = 1 */;
  input [7:0]D;
  output [7:0]Q;
endmodule
