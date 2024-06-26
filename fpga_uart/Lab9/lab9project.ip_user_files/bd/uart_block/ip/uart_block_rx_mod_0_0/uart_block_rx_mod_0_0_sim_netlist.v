// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Wed May  8 15:03:11 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab9/lab9project.gen/sources_1/bd/uart_block/ip/uart_block_rx_mod_0_0/uart_block_rx_mod_0_0_sim_netlist.v
// Design      : uart_block_rx_mod_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "uart_block_rx_mod_0_0,rx_mod,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "rx_mod,Vivado 2023.2.2" *) 
(* NotValidForBitStream *)
module uart_block_rx_mod_0_0
   (clk,
    rst,
    sin,
    data_out,
    intr);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN uart_block_clk, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input sin;
  output [7:0]data_out;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 intr INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME intr, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1" *) output intr;

  wire clk;
  wire [7:0]data_out;
  wire intr;
  wire rst;
  wire sin;

  uart_block_rx_mod_0_0_rx_mod U0
       (.clk(clk),
        .data_out(data_out),
        .intr(intr),
        .rst(rst),
        .sin(sin));
endmodule

(* ORIG_REF_NAME = "rx_mod" *) 
module uart_block_rx_mod_0_0_rx_mod
   (data_out,
    intr,
    sin,
    clk,
    rst);
  output [7:0]data_out;
  output intr;
  input sin;
  input clk;
  input rst;

  wire clk;
  wire [3:0]count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire [7:0]data_out;
  wire intr;
  wire [8:8]p_0_in;
  wire [9:0]p_1_in;
  wire rst;
  wire rxin;
  wire rxmt;
  wire rxmt0;
  wire rxmt_i_1_n_0;
  wire \rxreg[8]_i_1_n_0 ;
  wire \rxreg[8]_i_3_n_0 ;
  wire \rxreg_reg_n_0_[0] ;
  wire sin;
  wire start_flag_i_1_n_0;
  wire start_flag_reg_n_0;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h45)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .I1(rxin),
        .I2(rxmt),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6066)) 
    \count[1]_i_1 
       (.I0(count[1]),
        .I1(count[0]),
        .I2(rxin),
        .I3(rxmt),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0BBBB000)) 
    \count[2]_i_1 
       (.I0(rxin),
        .I1(rxmt),
        .I2(count[0]),
        .I3(count[1]),
        .I4(count[2]),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h5511AA20)) 
    \count[3]_i_1 
       (.I0(\rxreg[8]_i_3_n_0 ),
        .I1(rxmt),
        .I2(start_flag_reg_n_0),
        .I3(rxin),
        .I4(count[3]),
        .O(\count[3]_i_1_n_0 ));
  FDCE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]));
  FDCE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[1]_i_1_n_0 ),
        .Q(count[1]));
  FDCE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[2]_i_1_n_0 ),
        .Q(count[2]));
  FDCE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count[3]_i_1_n_0 ),
        .Q(count[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    intr_i_1
       (.I0(\rxreg_reg_n_0_[0] ),
        .I1(p_0_in),
        .I2(rxmt),
        .O(rxmt0));
  FDCE intr_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(rxmt0),
        .Q(intr));
  FDPE rxin_reg
       (.C(clk),
        .CE(1'b1),
        .D(sin),
        .PRE(rst),
        .Q(rxin));
  LUT4 #(
    .INIT(16'h88B8)) 
    rxmt_i_1
       (.I0(rxin),
        .I1(rxmt),
        .I2(p_0_in),
        .I3(\rxreg_reg_n_0_[0] ),
        .O(rxmt_i_1_n_0));
  FDPE rxmt_reg
       (.C(clk),
        .CE(1'b1),
        .D(rxmt_i_1_n_0),
        .PRE(rst),
        .Q(rxmt));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[0]_i_1 
       (.I0(data_out[0]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[1]_i_1 
       (.I0(data_out[1]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[2]_i_1 
       (.I0(data_out[2]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[3]_i_1 
       (.I0(data_out[3]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[4]_i_1 
       (.I0(data_out[4]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[5]_i_1 
       (.I0(data_out[5]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[6]_i_1 
       (.I0(data_out[6]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[7]_i_1 
       (.I0(data_out[7]),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[7]));
  LUT5 #(
    .INIT(32'h3333F100)) 
    \rxreg[8]_i_1 
       (.I0(start_flag_reg_n_0),
        .I1(rxin),
        .I2(count[3]),
        .I3(\rxreg[8]_i_3_n_0 ),
        .I4(rxmt),
        .O(\rxreg[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \rxreg[8]_i_2 
       (.I0(p_0_in),
        .I1(rxin),
        .I2(rxmt),
        .O(p_1_in[8]));
  LUT3 #(
    .INIT(8'h80)) 
    \rxreg[8]_i_3 
       (.I0(count[2]),
        .I1(count[1]),
        .I2(count[0]),
        .O(\rxreg[8]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \rxreg[9]_i_1 
       (.I0(rxmt),
        .I1(rxin),
        .O(p_1_in[9]));
  FDPE \rxreg_reg[0] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[0]),
        .PRE(rst),
        .Q(\rxreg_reg_n_0_[0] ));
  FDPE \rxreg_reg[1] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[1]),
        .PRE(rst),
        .Q(data_out[0]));
  FDPE \rxreg_reg[2] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[2]),
        .PRE(rst),
        .Q(data_out[1]));
  FDPE \rxreg_reg[3] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[3]),
        .PRE(rst),
        .Q(data_out[2]));
  FDPE \rxreg_reg[4] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[4]),
        .PRE(rst),
        .Q(data_out[3]));
  FDPE \rxreg_reg[5] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[5]),
        .PRE(rst),
        .Q(data_out[4]));
  FDPE \rxreg_reg[6] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[6]),
        .PRE(rst),
        .Q(data_out[5]));
  FDPE \rxreg_reg[7] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[7]),
        .PRE(rst),
        .Q(data_out[6]));
  FDPE \rxreg_reg[8] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[8]),
        .PRE(rst),
        .Q(data_out[7]));
  FDPE \rxreg_reg[9] 
       (.C(clk),
        .CE(\rxreg[8]_i_1_n_0 ),
        .D(p_1_in[9]),
        .PRE(rst),
        .Q(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hC0F1C0F0)) 
    start_flag_i_1
       (.I0(count[3]),
        .I1(rxin),
        .I2(start_flag_reg_n_0),
        .I3(rxmt),
        .I4(\rxreg[8]_i_3_n_0 ),
        .O(start_flag_i_1_n_0));
  FDCE start_flag_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(start_flag_i_1_n_0),
        .Q(start_flag_reg_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
