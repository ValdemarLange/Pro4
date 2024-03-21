//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Thu Mar 21 14:26:45 2024
//Host        : madsxps running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target test_wrapper.bd
//Design      : test_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module test_wrapper
   (busy,
    ck_miso,
    ck_mosi,
    ck_sck,
    ck_ss,
    cout,
    i_parallel,
    led);
  output busy;
  output ck_miso;
  input ck_mosi;
  input ck_sck;
  input ck_ss;
  output [7:0]cout;
  input i_parallel;
  output led;

  wire busy;
  wire ck_miso;
  wire ck_mosi;
  wire ck_sck;
  wire ck_ss;
  wire [7:0]cout;
  wire i_parallel;
  wire led;

  test test_i
       (.busy(busy),
        .ck_miso(ck_miso),
        .ck_mosi(ck_mosi),
        .ck_sck(ck_sck),
        .ck_ss(ck_ss),
        .cout(cout),
        .i_parallel(i_parallel),
        .led(led));
endmodule
