// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Thu Mar 21 13:36:59 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_comparator_0_0/pwm_block_comparator_0_0_sim_netlist.v
// Design      : pwm_block_comparator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_block_comparator_0_0,comparator,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "comparator,Vivado 2023.2.2" *) 
(* NotValidForBitStream *)
module pwm_block_comparator_0_0
   (a,
    b,
    y);
  input [9:0]a;
  input [9:0]b;
  output y;

  wire [9:0]a;
  wire [9:0]b;
  wire y;

  pwm_block_comparator_0_0_comparator U0
       (.a(a),
        .b(b),
        .y(y));
endmodule

(* ORIG_REF_NAME = "comparator" *) 
module pwm_block_comparator_0_0_comparator
   (y,
    a,
    b);
  output y;
  input [9:0]a;
  input [9:0]b;

  wire [9:0]a;
  wire [9:0]b;
  wire y;
  wire y_INST_0_i_10_n_0;
  wire y_INST_0_i_11_n_0;
  wire y_INST_0_i_1_n_0;
  wire y_INST_0_i_1_n_1;
  wire y_INST_0_i_1_n_2;
  wire y_INST_0_i_1_n_3;
  wire y_INST_0_i_2_n_0;
  wire y_INST_0_i_3_n_0;
  wire y_INST_0_i_4_n_0;
  wire y_INST_0_i_5_n_0;
  wire y_INST_0_i_6_n_0;
  wire y_INST_0_i_7_n_0;
  wire y_INST_0_i_8_n_0;
  wire y_INST_0_i_9_n_0;
  wire [3:1]NLW_y_INST_0_CO_UNCONNECTED;
  wire [3:0]NLW_y_INST_0_O_UNCONNECTED;
  wire [3:0]NLW_y_INST_0_i_1_O_UNCONNECTED;

  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 y_INST_0
       (.CI(y_INST_0_i_1_n_0),
        .CO({NLW_y_INST_0_CO_UNCONNECTED[3:1],y}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,y_INST_0_i_2_n_0}),
        .O(NLW_y_INST_0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,y_INST_0_i_3_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 y_INST_0_i_1
       (.CI(1'b0),
        .CO({y_INST_0_i_1_n_0,y_INST_0_i_1_n_1,y_INST_0_i_1_n_2,y_INST_0_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({y_INST_0_i_4_n_0,y_INST_0_i_5_n_0,y_INST_0_i_6_n_0,y_INST_0_i_7_n_0}),
        .O(NLW_y_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({y_INST_0_i_8_n_0,y_INST_0_i_9_n_0,y_INST_0_i_10_n_0,y_INST_0_i_11_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    y_INST_0_i_10
       (.I0(a[2]),
        .I1(b[2]),
        .I2(a[3]),
        .I3(b[3]),
        .O(y_INST_0_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    y_INST_0_i_11
       (.I0(a[0]),
        .I1(b[0]),
        .I2(a[1]),
        .I3(b[1]),
        .O(y_INST_0_i_11_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    y_INST_0_i_2
       (.I0(a[8]),
        .I1(b[8]),
        .I2(b[9]),
        .I3(a[9]),
        .O(y_INST_0_i_2_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    y_INST_0_i_3
       (.I0(a[8]),
        .I1(b[8]),
        .I2(a[9]),
        .I3(b[9]),
        .O(y_INST_0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    y_INST_0_i_4
       (.I0(a[6]),
        .I1(b[6]),
        .I2(b[7]),
        .I3(a[7]),
        .O(y_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    y_INST_0_i_5
       (.I0(a[4]),
        .I1(b[4]),
        .I2(b[5]),
        .I3(a[5]),
        .O(y_INST_0_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    y_INST_0_i_6
       (.I0(a[2]),
        .I1(b[2]),
        .I2(b[3]),
        .I3(a[3]),
        .O(y_INST_0_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    y_INST_0_i_7
       (.I0(a[0]),
        .I1(b[0]),
        .I2(b[1]),
        .I3(a[1]),
        .O(y_INST_0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    y_INST_0_i_8
       (.I0(a[6]),
        .I1(b[6]),
        .I2(a[7]),
        .I3(b[7]),
        .O(y_INST_0_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    y_INST_0_i_9
       (.I0(a[4]),
        .I1(b[4]),
        .I2(a[5]),
        .I3(b[5]),
        .O(y_INST_0_i_9_n_0));
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
