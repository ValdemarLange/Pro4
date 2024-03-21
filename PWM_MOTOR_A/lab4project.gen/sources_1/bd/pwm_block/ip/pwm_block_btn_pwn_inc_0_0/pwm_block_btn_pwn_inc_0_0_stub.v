// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Thu Mar 21 14:02:24 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_btn_pwn_inc_0_0/pwm_block_btn_pwn_inc_0_0_stub.v
// Design      : pwm_block_btn_pwn_inc_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "btn_pwn_inc,Vivado 2023.2.2" *)
module pwm_block_btn_pwn_inc_0_0(i, o)
/* synthesis syn_black_box black_box_pad_pin="o[9:0]" */
/* synthesis syn_force_seq_prim="i" */;
  input i /* synthesis syn_isclock = 1 */;
  output [9:0]o;
endmodule
