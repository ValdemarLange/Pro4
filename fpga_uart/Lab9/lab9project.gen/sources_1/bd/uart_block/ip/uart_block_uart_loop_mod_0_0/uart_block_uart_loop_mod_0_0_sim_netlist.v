// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Wed May 15 15:15:56 2024
// Host        : Amh2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab9/lab9project.gen/sources_1/bd/uart_block/ip/uart_block_uart_loop_mod_0_0/uart_block_uart_loop_mod_0_0_sim_netlist.v
// Design      : uart_block_uart_loop_mod_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "uart_block_uart_loop_mod_0_0,uart_loop_mod,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "uart_loop_mod,Vivado 2023.2.2" *) 
(* NotValidForBitStream *)
module uart_block_uart_loop_mod_0_0
   (clkfast,
    data_out,
    intr,
    rst,
    xmitmt,
    data_in,
    shift_load);
  input clkfast;
  input [7:0]data_out;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 intr INTERRUPT" *) (* x_interface_parameter = "XIL_INTERFACENAME intr, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1" *) input intr;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input xmitmt;
  output [7:0]data_in;
  output shift_load;

  wire clkfast;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire intr;
  wire rst;
  wire shift_load;
  wire xmitmt;

  uart_block_uart_loop_mod_0_0_uart_loop_mod U0
       (.clkfast(clkfast),
        .data_in(data_in),
        .data_out(data_out),
        .intr(intr),
        .rst(rst),
        .shift_load(shift_load),
        .xmitmt(xmitmt));
endmodule

(* ORIG_REF_NAME = "uart_loop_mod" *) 
module uart_block_uart_loop_mod_0_0_uart_loop_mod
   (shift_load,
    data_in,
    clkfast,
    rst,
    data_out,
    intr,
    xmitmt);
  output shift_load;
  output [7:0]data_in;
  input clkfast;
  input rst;
  input [7:0]data_out;
  input intr;
  input xmitmt;

  wire \FSM_onehot_current_state[0]_i_1_n_0 ;
  wire \FSM_onehot_current_state[1]_i_1_n_0 ;
  wire \FSM_onehot_current_state_reg_n_0_[1] ;
  wire \FSM_onehot_current_state_reg_n_0_[2] ;
  wire clkfast;
  wire [7:0]data_in;
  wire [7:0]data_out;
  wire intr;
  wire rst;
  wire shift_load;
  wire shift_load_reg_i_1_n_0;
  wire uart_data;
  wire xmitmt;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_current_state[0]_i_1 
       (.I0(intr),
        .I1(uart_data),
        .I2(xmitmt),
        .I3(\FSM_onehot_current_state_reg_n_0_[2] ),
        .O(\FSM_onehot_current_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_current_state[1]_i_1 
       (.I0(intr),
        .I1(uart_data),
        .I2(xmitmt),
        .I3(\FSM_onehot_current_state_reg_n_0_[2] ),
        .O(\FSM_onehot_current_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s2:100,s0:001,s1:010" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_current_state_reg[0] 
       (.C(clkfast),
        .CE(1'b1),
        .D(\FSM_onehot_current_state[0]_i_1_n_0 ),
        .PRE(rst),
        .Q(uart_data));
  (* FSM_ENCODED_STATES = "s2:100,s0:001,s1:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[1] 
       (.C(clkfast),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_onehot_current_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_current_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "s2:100,s0:001,s1:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[2] 
       (.C(clkfast),
        .CE(1'b1),
        .CLR(rst),
        .D(\FSM_onehot_current_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_current_state_reg_n_0_[2] ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    shift_load_reg
       (.CLR(1'b0),
        .D(\FSM_onehot_current_state_reg_n_0_[1] ),
        .G(shift_load_reg_i_1_n_0),
        .GE(1'b1),
        .Q(shift_load));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    shift_load_reg_i_1
       (.I0(uart_data),
        .I1(\FSM_onehot_current_state_reg_n_0_[1] ),
        .O(shift_load_reg_i_1_n_0));
  FDCE \uart_data_reg[0] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[0]),
        .Q(data_in[0]));
  FDCE \uart_data_reg[1] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[1]),
        .Q(data_in[1]));
  FDCE \uart_data_reg[2] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[2]),
        .Q(data_in[2]));
  FDCE \uart_data_reg[3] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[3]),
        .Q(data_in[3]));
  FDCE \uart_data_reg[4] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[4]),
        .Q(data_in[4]));
  FDCE \uart_data_reg[5] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[5]),
        .Q(data_in[5]));
  FDCE \uart_data_reg[6] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[6]),
        .Q(data_in[6]));
  FDCE \uart_data_reg[7] 
       (.C(clkfast),
        .CE(uart_data),
        .CLR(rst),
        .D(data_out[7]),
        .Q(data_in[7]));
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
