--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Tue May 14 15:28:48 2024
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
    txd : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of uart_block : entity is "uart_block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=uart_block,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
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
  signal btn0_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal clk_divider_emad_0_clk_div : STD_LOGIC;
  signal d_latch_0_o : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_mod_0_data_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_mod_0_intr : STD_LOGIC;
  signal sin_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of btn0 : signal is "xilinx.com:signal:reset:1.0 RST.BTN0 RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of btn0 : signal is "XIL_INTERFACENAME RST.BTN0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET btn0, CLK_DOMAIN uart_block_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  btn0_1 <= btn0;
  clk_1 <= clk;
  led(7 downto 0) <= d_latch_0_o(7 downto 0);
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
      Q(7 downto 0) => d_latch_0_o(7 downto 0),
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
end STRUCTURE;
