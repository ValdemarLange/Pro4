// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Thu Mar 21 14:02:24 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_btn_pwn_inc_0_0/pwm_block_btn_pwn_inc_0_0_sim_netlist.v
// Design      : pwm_block_btn_pwn_inc_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pwm_block_btn_pwn_inc_0_0,btn_pwn_inc,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "btn_pwn_inc,Vivado 2023.2.2" *) 
(* NotValidForBitStream *)
module pwm_block_btn_pwn_inc_0_0
   (i,
    o);
  input i;
  output [9:0]o;

  wire \<const0> ;
  wire i;
  wire [9:1]\^o ;

  assign o[9:1] = \^o [9:1];
  assign o[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  pwm_block_btn_pwn_inc_0_0_btn_pwn_inc U0
       (.Q(\^o ),
        .i(i));
endmodule

(* ORIG_REF_NAME = "btn_pwn_inc" *) 
module pwm_block_btn_pwn_inc_0_0_btn_pwn_inc
   (Q,
    i);
  output [8:0]Q;
  input i;

  wire [8:0]Q;
  wire i;
  wire \output_temp[2]_i_1_n_0 ;
  wire \output_temp[5]_i_1_n_0 ;
  wire \output_temp[6]_i_1_n_0 ;
  wire \output_temp[9]_i_2_n_0 ;
  wire \output_temp[9]_i_3_n_0 ;
  wire \output_temp[9]_i_4_n_0 ;
  wire [9:1]plusOp;

  LUT1 #(
    .INIT(2'h1)) 
    \output_temp[1]_i_1 
       (.I0(Q[0]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \output_temp[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\output_temp[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h1E)) 
    \output_temp[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \output_temp[4]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hA80057FF)) 
    \output_temp[5]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\output_temp[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEAAAAA11155555)) 
    \output_temp[6]_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[5]),
        .O(\output_temp[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output_temp[7]_i_1 
       (.I0(\output_temp[9]_i_3_n_0 ),
        .I1(Q[6]),
        .O(plusOp[7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \output_temp[8]_i_1 
       (.I0(\output_temp[9]_i_3_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(plusOp[8]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \output_temp[9]_i_1 
       (.I0(Q[6]),
        .I1(\output_temp[9]_i_3_n_0 ),
        .I2(Q[7]),
        .I3(Q[8]),
        .O(plusOp[9]));
  LUT5 #(
    .INIT(32'h00008000)) 
    \output_temp[9]_i_2 
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(\output_temp[9]_i_4_n_0 ),
        .O(\output_temp[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEAAAAA)) 
    \output_temp[9]_i_3 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[5]),
        .O(\output_temp[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \output_temp[9]_i_4 
       (.I0(Q[7]),
        .I1(Q[6]),
        .I2(Q[1]),
        .I3(Q[8]),
        .O(\output_temp[9]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[1] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(plusOp[1]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[2] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(\output_temp[2]_i_1_n_0 ),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[3] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(plusOp[3]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[4] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(plusOp[4]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[5] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(\output_temp[5]_i_1_n_0 ),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[6] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(\output_temp[6]_i_1_n_0 ),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[7] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(plusOp[7]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[8] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(plusOp[8]),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \output_temp_reg[9] 
       (.C(i),
        .CE(1'b1),
        .CLR(\output_temp[9]_i_2_n_0 ),
        .D(plusOp[9]),
        .Q(Q[8]));
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
