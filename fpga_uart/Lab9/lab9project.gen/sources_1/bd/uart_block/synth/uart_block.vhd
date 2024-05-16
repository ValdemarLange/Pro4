--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Wed May 15 15:36:08 2024
--Host        : Amh2 running 64-bit major release  (build 9200)
--Command     : generate_target uart_block.bd
--Design      : uart_block
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uart_block is
  port (
    btn0 : in STD_LOGIC;
    clk : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxd : out STD_LOGIC;
    txd : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of uart_block : entity is "uart_block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=uart_block,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of uart_block : entity is "uart_block.hwdef";
end uart_block;

architecture STRUCTURE of uart_block is
  component uart_block_rx_mod_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    sin : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    intr : out STD_LOGIC
  );
  end component uart_block_rx_mod_0_0;
  component uart_block_clk_divider_emad_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    clk_div : out STD_LOGIC
  );
  end component uart_block_clk_divider_emad_0_0;
  component uart_block_d_latch_0_0 is
  port (
    en : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component uart_block_d_latch_0_0;
  component uart_block_uart_loop_mod_0_0 is
  port (
    clkfast : in STD_LOGIC;
    data_out : in STD_LOGIC_VECTOR ( 7 downto 0 );
    intr : in STD_LOGIC;
    rst : in STD_LOGIC;
    xmitmt : in STD_LOGIC;
    data_in : out STD_LOGIC_VECTOR ( 7 downto 0 );
    shift_load : out STD_LOGIC
  );
  end component uart_block_uart_loop_mod_0_0;
  component uart_block_tx_mod_0_1 is
  port (
    clkfast : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rst : in STD_LOGIC;
    shift_load : in STD_LOGIC;
    sout : out STD_LOGIC;
    xmitmt : out STD_LOGIC
  );
  end component uart_block_tx_mod_0_1;
  signal btn0_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal clk_divider_emad_0_clk_div : STD_LOGIC;
  signal d_latch_0_Q : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_mod_0_data_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_mod_0_intr : STD_LOGIC;
  signal sin_1 : STD_LOGIC;
  signal tx_mod_0_sout : STD_LOGIC;
  signal tx_mod_0_xmitmt : STD_LOGIC;
  signal uart_loop_mod_0_data_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal uart_loop_mod_0_shift_load : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of btn0 : signal is "xilinx.com:signal:reset:1.0 RST.BTN0 RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of btn0 : signal is "XIL_INTERFACENAME RST.BTN0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET btn0, CLK_DOMAIN uart_block_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  btn0_1 <= btn0;
  clk_1 <= clk;
  led(7 downto 0) <= d_latch_0_Q(7 downto 0);
  rxd <= tx_mod_0_sout;
  sin_1 <= txd;
clk_divider_emad_0: component uart_block_clk_divider_emad_0_0
     port map (
      clk => clk_1,
      clk_div => clk_divider_emad_0_clk_div,
      rst => btn0_1
    );
d_latch_0: component uart_block_d_latch_0_0
     port map (
      D(7 downto 0) => rx_mod_0_data_out(7 downto 0),
      Q(7 downto 0) => d_latch_0_Q(7 downto 0),
      en => rx_mod_0_intr
    );
rx_mod_0: component uart_block_rx_mod_0_0
     port map (
      clk => clk_divider_emad_0_clk_div,
      data_out(7 downto 0) => rx_mod_0_data_out(7 downto 0),
      intr => rx_mod_0_intr,
      rst => btn0_1,
      sin => sin_1
    );
tx_mod_0: component uart_block_tx_mod_0_1
     port map (
      clkfast => clk_divider_emad_0_clk_div,
      data_in(7 downto 0) => uart_loop_mod_0_data_in(7 downto 0),
      rst => btn0_1,
      shift_load => uart_loop_mod_0_shift_load,
      sout => tx_mod_0_sout,
      xmitmt => tx_mod_0_xmitmt
    );
uart_loop_mod_0: component uart_block_uart_loop_mod_0_0
     port map (
      clkfast => clk_divider_emad_0_clk_div,
      data_in(7 downto 0) => uart_loop_mod_0_data_in(7 downto 0),
      data_out(7 downto 0) => rx_mod_0_data_out(7 downto 0),
      intr => rx_mod_0_intr,
      rst => btn0_1,
      shift_load => uart_loop_mod_0_shift_load,
      xmitmt => tx_mod_0_xmitmt
    );
end STRUCTURE;
