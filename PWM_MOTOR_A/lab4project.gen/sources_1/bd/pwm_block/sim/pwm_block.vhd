--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Thu Mar 21 14:01:41 2024
--Host        : Amh2 running 64-bit major release  (build 9200)
--Command     : generate_target pwm_block.bd
--Design      : pwm_block
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block is
  port (
    EN_A : out STD_LOGIC_VECTOR ( 0 to 0 );
    IN1_A : out STD_LOGIC;
    IN2_A : out STD_LOGIC;
    btn : in STD_LOGIC;
    btn2 : in STD_LOGIC;
    clk : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pwm_block : entity is "pwm_block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pwm_block,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of pwm_block : entity is "pwm_block.hwdef";
end pwm_block;

architecture STRUCTURE of pwm_block is
  component pwm_block_counter_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component pwm_block_counter_0_0;
  component pwm_block_comparator_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    b : in STD_LOGIC_VECTOR ( 9 downto 0 );
    y : out STD_LOGIC
  );
  end component pwm_block_comparator_0_0;
  component pwm_block_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_block_xlconstant_1_0;
  component pwm_block_clk_divider_0_0 is
  port (
    clk : in STD_LOGIC;
    clk_out : out STD_LOGIC
  );
  end component pwm_block_clk_divider_0_0;
  component pwm_block_demultiplexer_1x2_0_2 is
  port (
    i : in STD_LOGIC;
    s : in STD_LOGIC;
    IN1 : out STD_LOGIC;
    IN2 : out STD_LOGIC
  );
  end component pwm_block_demultiplexer_1x2_0_2;
  component pwm_block_xlconstant_2_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_block_xlconstant_2_0;
  component pwm_block_d_latch_0_0 is
  port (
    i_btn : in STD_LOGIC;
    o : out STD_LOGIC
  );
  end component pwm_block_d_latch_0_0;
  component pwm_block_btn_pwn_inc_0_0 is
  port (
    i : in STD_LOGIC;
    o : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component pwm_block_btn_pwn_inc_0_0;
  signal btn2_1 : STD_LOGIC;
  signal btn_1 : STD_LOGIC;
  signal btn_pwn_inc_0_o : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal clk_1 : STD_LOGIC;
  signal clk_divider_0_clk_out : STD_LOGIC;
  signal comparator_0_y : STD_LOGIC;
  signal counter_0_cnt : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal d_latch_0_o : STD_LOGIC;
  signal demultiplexer_1x2_0_IN1 : STD_LOGIC;
  signal demultiplexer_1x2_0_IN2 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  EN_A(0) <= xlconstant_1_dout(0);
  IN1_A <= demultiplexer_1x2_0_IN1;
  IN2_A <= demultiplexer_1x2_0_IN2;
  btn2_1 <= btn2;
  btn_1 <= btn;
  clk_1 <= clk;
  led_0 <= demultiplexer_1x2_0_IN1;
  led_1 <= demultiplexer_1x2_0_IN2;
btn_pwn_inc_0: component pwm_block_btn_pwn_inc_0_0
     port map (
      i => btn2_1,
      o(9 downto 0) => btn_pwn_inc_0_o(9 downto 0)
    );
clk_divider_0: component pwm_block_clk_divider_0_0
     port map (
      clk => clk_1,
      clk_out => clk_divider_0_clk_out
    );
comparator_0: component pwm_block_comparator_0_0
     port map (
      a(9 downto 0) => counter_0_cnt(9 downto 0),
      b(9 downto 0) => btn_pwn_inc_0_o(9 downto 0),
      y => comparator_0_y
    );
counter_0: component pwm_block_counter_0_0
     port map (
      clk => clk_divider_0_clk_out,
      cnt(9 downto 0) => counter_0_cnt(9 downto 0),
      en => xlconstant_1_dout(0),
      rst => xlconstant_2_dout(0)
    );
d_latch_0: component pwm_block_d_latch_0_0
     port map (
      i_btn => btn_1,
      o => d_latch_0_o
    );
demultiplexer_1x2_0: component pwm_block_demultiplexer_1x2_0_2
     port map (
      IN1 => demultiplexer_1x2_0_IN1,
      IN2 => demultiplexer_1x2_0_IN2,
      i => comparator_0_y,
      s => d_latch_0_o
    );
xlconstant_1: component pwm_block_xlconstant_1_0
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
xlconstant_2: component pwm_block_xlconstant_2_0
     port map (
      dout(0) => xlconstant_2_dout(0)
    );
end STRUCTURE;
