// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Wed May  8 15:15:03 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab9/lab9project.gen/sources_1/bd/uart_block/ip/uart_block_clk_divider_emad_0_0/uart_block_clk_divider_emad_0_0_sim_netlist.v
// Design      : uart_block_clk_divider_emad_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "uart_block_clk_divider_emad_0_0,clk_divider_emad,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "clk_divider_emad,Vivado 2023.2.2" *) 
(* NotValidForBitStream *)
module uart_block_clk_divider_emad_0_0
   (clk,
    rst,
    clk_div);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN uart_block_clk, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  output clk_div;

  wire clk;
  wire clk_div;
  wire rst;

  uart_block_clk_divider_emad_0_0_clk_divider_emad U0
       (.clk(clk),
        .clk_div(clk_div),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "clk_divider_emad" *) 
module uart_block_clk_divider_emad_0_0_clk_divider_emad
   (clk_div,
    clk,
    rst);
  output clk_div;
  input clk;
  input rst;

  wire clk;
  wire clk_div;
  wire clk_div_sig_i_1_n_0;
  wire clk_div_sig_i_2_n_0;
  wire clk_div_sig_i_3_n_0;
  wire \count_sig[4]_i_1_n_0 ;
  wire \count_sig[7]_i_2_n_0 ;
  wire [7:0]count_sig_reg;
  wire [7:0]p_0_in;
  wire rst;

  LUT4 #(
    .INIT(16'hFB04)) 
    clk_div_sig_i_1
       (.I0(rst),
        .I1(clk_div_sig_i_2_n_0),
        .I2(clk_div_sig_i_3_n_0),
        .I3(clk_div),
        .O(clk_div_sig_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    clk_div_sig_i_2
       (.I0(count_sig_reg[6]),
        .I1(count_sig_reg[0]),
        .I2(count_sig_reg[7]),
        .I3(count_sig_reg[5]),
        .O(clk_div_sig_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    clk_div_sig_i_3
       (.I0(count_sig_reg[4]),
        .I1(count_sig_reg[3]),
        .I2(count_sig_reg[2]),
        .I3(count_sig_reg[1]),
        .O(clk_div_sig_i_3_n_0));
  FDRE #(
    .INIT(1'b1)) 
    clk_div_sig_reg
       (.C(clk),
        .CE(1'b1),
        .D(clk_div_sig_i_1_n_0),
        .Q(clk_div),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0F0F0F0E)) 
    \count_sig[0]_i_1 
       (.I0(clk_div_sig_i_3_n_0),
        .I1(count_sig_reg[6]),
        .I2(count_sig_reg[0]),
        .I3(count_sig_reg[7]),
        .I4(count_sig_reg[5]),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'h55AA55AA55AA55A8)) 
    \count_sig[1]_i_1 
       (.I0(count_sig_reg[1]),
        .I1(clk_div_sig_i_3_n_0),
        .I2(count_sig_reg[6]),
        .I3(count_sig_reg[0]),
        .I4(count_sig_reg[7]),
        .I5(count_sig_reg[5]),
        .O(p_0_in[1]));
  LUT6 #(
    .INIT(64'h00DFFFFFFF000000)) 
    \count_sig[2]_i_1 
       (.I0(count_sig_reg[4]),
        .I1(count_sig_reg[3]),
        .I2(clk_div_sig_i_2_n_0),
        .I3(count_sig_reg[0]),
        .I4(count_sig_reg[1]),
        .I5(count_sig_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \count_sig[3]_i_1 
       (.I0(count_sig_reg[3]),
        .I1(count_sig_reg[0]),
        .I2(count_sig_reg[1]),
        .I3(count_sig_reg[2]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'h1DFFFFFFC0000000)) 
    \count_sig[4]_i_1 
       (.I0(clk_div_sig_i_2_n_0),
        .I1(count_sig_reg[3]),
        .I2(count_sig_reg[0]),
        .I3(count_sig_reg[1]),
        .I4(count_sig_reg[2]),
        .I5(count_sig_reg[4]),
        .O(\count_sig[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \count_sig[5]_i_1 
       (.I0(count_sig_reg[5]),
        .I1(count_sig_reg[3]),
        .I2(count_sig_reg[0]),
        .I3(count_sig_reg[1]),
        .I4(count_sig_reg[2]),
        .I5(count_sig_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_sig[6]_i_1 
       (.I0(count_sig_reg[6]),
        .I1(\count_sig[7]_i_2_n_0 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count_sig[7]_i_1 
       (.I0(count_sig_reg[7]),
        .I1(\count_sig[7]_i_2_n_0 ),
        .I2(count_sig_reg[6]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_sig[7]_i_2 
       (.I0(count_sig_reg[5]),
        .I1(count_sig_reg[3]),
        .I2(count_sig_reg[0]),
        .I3(count_sig_reg[1]),
        .I4(count_sig_reg[2]),
        .I5(count_sig_reg[4]),
        .O(\count_sig[7]_i_2_n_0 ));
  FDCE \count_sig_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[0]),
        .Q(count_sig_reg[0]));
  FDCE \count_sig_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[1]),
        .Q(count_sig_reg[1]));
  FDCE \count_sig_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[2]),
        .Q(count_sig_reg[2]));
  FDCE \count_sig_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[3]),
        .Q(count_sig_reg[3]));
  FDCE \count_sig_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(\count_sig[4]_i_1_n_0 ),
        .Q(count_sig_reg[4]));
  FDCE \count_sig_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[5]),
        .Q(count_sig_reg[5]));
  FDCE \count_sig_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[6]),
        .Q(count_sig_reg[6]));
  FDCE \count_sig_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(rst),
        .D(p_0_in[7]),
        .Q(count_sig_reg[7]));
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
