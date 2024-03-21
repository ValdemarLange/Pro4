//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Thu Mar 21 14:26:45 2024
//Host        : madsxps running 64-bit Ubuntu 22.04.4 LTS
//Command     : generate_target test.bd
//Design      : test
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "test,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=test,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "test.hwdef" *) 
module test
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COUT, LAYERED_METADATA undef" *) output [7:0]cout;
  input i_parallel;
  output led;

  wire comparator_0_o;
  wire i_parallel_1;
  wire mosi_1;
  wire sck_1;
  wire spi_slave_0_ck_miso;
  wire spi_slave_0_o_busy;
  wire [7:0]spi_slave_0_o_data_parallel;
  wire ss_1;
  wire [7:0]xlconstant_0_dout;

  assign busy = spi_slave_0_o_busy;
  assign ck_miso = spi_slave_0_ck_miso;
  assign cout[7:0] = spi_slave_0_o_data_parallel;
  assign i_parallel_1 = i_parallel;
  assign led = comparator_0_o;
  assign mosi_1 = ck_mosi;
  assign sck_1 = ck_sck;
  assign ss_1 = ck_ss;
  test_comparator_0_0 comparator_0
       (.a(spi_slave_0_o_data_parallel),
        .b(xlconstant_0_dout),
        .o(comparator_0_o));
  test_spi_slave_0_0 spi_slave_0
       (.ck_miso(spi_slave_0_ck_miso),
        .ck_mosi(mosi_1),
        .ck_sck(sck_1),
        .ck_ss(ss_1),
        .i_data_parallel({i_parallel_1,i_parallel_1,i_parallel_1,i_parallel_1,i_parallel_1,i_parallel_1,i_parallel_1,i_parallel_1}),
        .o_busy(spi_slave_0_o_busy),
        .o_data_parallel(spi_slave_0_o_data_parallel));
  test_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
