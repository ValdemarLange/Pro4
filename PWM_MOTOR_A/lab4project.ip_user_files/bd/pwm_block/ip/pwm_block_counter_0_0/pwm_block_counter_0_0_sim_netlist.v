// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Thu Mar 21 13:36:59 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_counter_0_0/pwm_block_counter_0_0_sim_netlist.v
// Design      : pwm_block_counter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_block_counter_0_0,counter,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "counter,Vivado 2023.2.2" *) 
(* NotValidForBitStream *)
module pwm_block_counter_0_0
   (clk,
    rst,
    en,
    cnt);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input en;
  output [9:0]cnt;

  wire clk;
  wire [9:0]cnt;
  wire en;
  wire rst;

  pwm_block_counter_0_0_counter U0
       (.clk(clk),
        .en(en),
        .out(cnt),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "counter" *) 
module pwm_block_counter_0_0_counter
   (out,
    en,
    clk,
    rst);
  output [9:0]out;
  input en;
  input clk;
  input rst;

  wire clk;
  wire \cnt_int[9]_i_2_n_0 ;
  wire en;
  wire [9:0]out;
  wire [9:0]p_0_in;
  wire rst;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt_int[0]_i_1 
       (.I0(out[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_int[1]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_int[2]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_int[3]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt_int[4]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[3]),
        .I4(out[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt_int[5]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[4]),
        .I5(out[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_int[6]_i_1 
       (.I0(\cnt_int[9]_i_2_n_0 ),
        .I1(out[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_int[7]_i_1 
       (.I0(\cnt_int[9]_i_2_n_0 ),
        .I1(out[6]),
        .I2(out[7]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_int[8]_i_1 
       (.I0(out[6]),
        .I1(\cnt_int[9]_i_2_n_0 ),
        .I2(out[7]),
        .I3(out[8]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt_int[9]_i_1 
       (.I0(out[7]),
        .I1(\cnt_int[9]_i_2_n_0 ),
        .I2(out[6]),
        .I3(out[8]),
        .I4(out[9]),
        .O(p_0_in[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt_int[9]_i_2 
       (.I0(out[5]),
        .I1(out[3]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(out[2]),
        .I5(out[4]),
        .O(\cnt_int[9]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[0] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[0]),
        .Q(out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[1] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[1]),
        .Q(out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[2] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[2]),
        .Q(out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[3] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[3]),
        .Q(out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[4] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[4]),
        .Q(out[4]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[5] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[5]),
        .Q(out[5]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[6] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[6]),
        .Q(out[6]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[7] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[7]),
        .Q(out[7]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[8] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[8]),
        .Q(out[8]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_int_reg[9] 
       (.C(clk),
        .CE(en),
        .CLR(rst),
        .D(p_0_in[9]),
        .Q(out[9]));
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
