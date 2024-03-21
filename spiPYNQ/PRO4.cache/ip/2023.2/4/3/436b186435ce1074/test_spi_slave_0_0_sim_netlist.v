// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Mar 21 12:47:12 2024
// Host        : madsxps running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ test_spi_slave_0_0_sim_netlist.v
// Design      : test_spi_slave_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_slave
   (o_busy,
    o_data_parallel,
    ck_miso,
    i_data_parallel,
    ck_sck,
    ck_ss,
    ck_mosi);
  output o_busy;
  output [7:0]o_data_parallel;
  output ck_miso;
  input [7:0]i_data_parallel;
  input ck_sck;
  input ck_ss;
  input ck_mosi;

  wire ck_miso;
  wire ck_miso_i_1_n_0;
  wire ck_mosi;
  wire ck_sck;
  wire ck_ss;
  wire [7:0]i_data_parallel;
  wire o_busy;
  wire [7:0]o_data_parallel;
  wire p_0_in;
  wire p_0_in_0;
  wire \r_tx_data[0]_i_1_n_0 ;
  wire \r_tx_data[1]_i_1_n_0 ;
  wire \r_tx_data[2]_i_1_n_0 ;
  wire \r_tx_data[3]_i_1_n_0 ;
  wire \r_tx_data[4]_i_1_n_0 ;
  wire \r_tx_data[5]_i_1_n_0 ;
  wire \r_tx_data[6]_i_1_n_0 ;
  wire \r_tx_data_reg_n_0_[0] ;
  wire \r_tx_data_reg_n_0_[1] ;
  wire \r_tx_data_reg_n_0_[2] ;
  wire \r_tx_data_reg_n_0_[3] ;
  wire \r_tx_data_reg_n_0_[4] ;
  wire \r_tx_data_reg_n_0_[5] ;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    ck_miso_i_1
       (.I0(p_0_in_0),
        .I1(o_busy),
        .I2(i_data_parallel[7]),
        .O(ck_miso_i_1_n_0));
  FDRE ck_miso_reg
       (.C(ck_sck),
        .CE(p_0_in),
        .D(ck_miso_i_1_n_0),
        .Q(ck_miso),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \r_rx_data[7]_i_1 
       (.I0(ck_ss),
        .O(p_0_in));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[0] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(ck_mosi),
        .Q(o_data_parallel[0]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[1] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(o_data_parallel[0]),
        .Q(o_data_parallel[1]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[2] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(o_data_parallel[1]),
        .Q(o_data_parallel[2]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[3] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(o_data_parallel[2]),
        .Q(o_data_parallel[3]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[4] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(o_data_parallel[3]),
        .Q(o_data_parallel[4]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[5] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(o_data_parallel[4]),
        .Q(o_data_parallel[5]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[6] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(o_data_parallel[5]),
        .Q(o_data_parallel[6]),
        .R(1'b0));
  FDRE #(
    .IS_C_INVERTED(1'b1)) 
    \r_rx_data_reg[7] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(o_data_parallel[6]),
        .Q(o_data_parallel[7]),
        .R(1'b0));
  FDCE r_shift_ena_reg
       (.C(ck_sck),
        .CE(1'b1),
        .CLR(ck_ss),
        .D(1'b1),
        .Q(o_busy));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_tx_data[0]_i_1 
       (.I0(i_data_parallel[0]),
        .I1(o_busy),
        .O(\r_tx_data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_tx_data[1]_i_1 
       (.I0(\r_tx_data_reg_n_0_[0] ),
        .I1(o_busy),
        .I2(i_data_parallel[1]),
        .O(\r_tx_data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_tx_data[2]_i_1 
       (.I0(\r_tx_data_reg_n_0_[1] ),
        .I1(o_busy),
        .I2(i_data_parallel[2]),
        .O(\r_tx_data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_tx_data[3]_i_1 
       (.I0(\r_tx_data_reg_n_0_[2] ),
        .I1(o_busy),
        .I2(i_data_parallel[3]),
        .O(\r_tx_data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_tx_data[4]_i_1 
       (.I0(\r_tx_data_reg_n_0_[3] ),
        .I1(o_busy),
        .I2(i_data_parallel[4]),
        .O(\r_tx_data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_tx_data[5]_i_1 
       (.I0(\r_tx_data_reg_n_0_[4] ),
        .I1(o_busy),
        .I2(i_data_parallel[5]),
        .O(\r_tx_data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \r_tx_data[6]_i_1 
       (.I0(\r_tx_data_reg_n_0_[5] ),
        .I1(o_busy),
        .I2(i_data_parallel[6]),
        .O(\r_tx_data[6]_i_1_n_0 ));
  FDRE \r_tx_data_reg[0] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(\r_tx_data[0]_i_1_n_0 ),
        .Q(\r_tx_data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \r_tx_data_reg[1] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(\r_tx_data[1]_i_1_n_0 ),
        .Q(\r_tx_data_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \r_tx_data_reg[2] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(\r_tx_data[2]_i_1_n_0 ),
        .Q(\r_tx_data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \r_tx_data_reg[3] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(\r_tx_data[3]_i_1_n_0 ),
        .Q(\r_tx_data_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \r_tx_data_reg[4] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(\r_tx_data[4]_i_1_n_0 ),
        .Q(\r_tx_data_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \r_tx_data_reg[5] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(\r_tx_data[5]_i_1_n_0 ),
        .Q(\r_tx_data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \r_tx_data_reg[6] 
       (.C(ck_sck),
        .CE(p_0_in),
        .D(\r_tx_data[6]_i_1_n_0 ),
        .Q(p_0_in_0),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "test_spi_slave_0_0,spi_slave,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "spi_slave,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (o_busy,
    i_data_parallel,
    o_data_parallel,
    ck_sck,
    ck_ss,
    ck_mosi,
    ck_miso);
  output o_busy;
  input [7:0]i_data_parallel;
  output [7:0]o_data_parallel;
  input ck_sck;
  input ck_ss;
  input ck_mosi;
  output ck_miso;

  wire ck_miso;
  wire ck_mosi;
  wire ck_sck;
  wire ck_ss;
  wire [7:0]i_data_parallel;
  wire o_busy;
  wire [7:0]o_data_parallel;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_slave inst
       (.ck_miso(ck_miso),
        .ck_mosi(ck_mosi),
        .ck_sck(ck_sck),
        .ck_ss(ck_ss),
        .i_data_parallel(i_data_parallel),
        .o_busy(o_busy),
        .o_data_parallel(o_data_parallel));
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
