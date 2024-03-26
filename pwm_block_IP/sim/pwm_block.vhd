--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Mon Mar 25 09:54:09 2024
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
    EN_B : out STD_LOGIC_VECTOR ( 0 to 0 );
    IN1_A : out STD_LOGIC;
    IN1_B : out STD_LOGIC;
    IN2_A : out STD_LOGIC;
    IN2_B : out STD_LOGIC;
    btn0 : in STD_LOGIC;
    btn1 : in STD_LOGIC;
    btn2 : in STD_LOGIC;
    btn3 : in STD_LOGIC;
    clk : in STD_LOGIC;
    led0 : out STD_LOGIC;
    led1 : out STD_LOGIC;
    led2 : out STD_LOGIC;
    led3 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pwm_block : entity is "pwm_block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pwm_block,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=11,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
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
  component pwm_block_clk_divider_0_1 is
  port (
    clk : in STD_LOGIC;
    clk_out : out STD_LOGIC
  );
  end component pwm_block_clk_divider_0_1;
  component pwm_block_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_block_xlconstant_0_0;
  component pwm_block_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pwm_block_xlconstant_0_1;
  component pwm_block_btn_pwn_inc_0_0 is
  port (
    i : in STD_LOGIC;
    o : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component pwm_block_btn_pwn_inc_0_0;
  component pwm_block_comparator_0_1 is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    b : in STD_LOGIC_VECTOR ( 9 downto 0 );
    y : out STD_LOGIC
  );
  end component pwm_block_comparator_0_1;
  component pwm_block_d_latch_0_0 is
  port (
    i_btn : in STD_LOGIC;
    o : out STD_LOGIC
  );
  end component pwm_block_d_latch_0_0;
  component pwm_block_demultiplexer_1x2_0_0 is
  port (
    i : in STD_LOGIC;
    s : in STD_LOGIC;
    IN1 : out STD_LOGIC;
    IN2 : out STD_LOGIC
  );
  end component pwm_block_demultiplexer_1x2_0_0;
  component pwm_block_counter_1_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component pwm_block_counter_1_0;
  component pwm_block_comparator_1_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    b : in STD_LOGIC_VECTOR ( 9 downto 0 );
    y : out STD_LOGIC
  );
  end component pwm_block_comparator_1_0;
  component pwm_block_d_latch_1_0 is
  port (
    i_btn : in STD_LOGIC;
    o : out STD_LOGIC
  );
  end component pwm_block_d_latch_1_0;
  component pwm_block_btn_pwn_inc_1_0 is
  port (
    i : in STD_LOGIC;
    o : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component pwm_block_btn_pwn_inc_1_0;
  component pwm_block_demultiplexer_1x2_1_0 is
  port (
    i : in STD_LOGIC;
    s : in STD_LOGIC;
    IN1 : out STD_LOGIC;
    IN2 : out STD_LOGIC
  );
  end component pwm_block_demultiplexer_1x2_1_0;
  signal btn2_1 : STD_LOGIC;
  signal btn2_2 : STD_LOGIC;
  signal btn3_1 : STD_LOGIC;
  signal btn_1 : STD_LOGIC;
  signal btn_pwn_inc_0_o : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal btn_pwn_inc_1_o : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal clk_1 : STD_LOGIC;
  signal clk_divider_0_clk_out : STD_LOGIC;
  signal comparator_0_y : STD_LOGIC;
  signal comparator_1_y : STD_LOGIC;
  signal counter_0_cnt : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal counter_1_cnt : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal d_latch_0_o : STD_LOGIC;
  signal d_latch_1_o : STD_LOGIC;
  signal demultiplexer_1x2_0_IN1 : STD_LOGIC;
  signal demultiplexer_1x2_0_IN2 : STD_LOGIC;
  signal demultiplexer_1x2_1_IN1 : STD_LOGIC;
  signal demultiplexer_1x2_1_IN2 : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_0_dout1 : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  EN_A(0) <= xlconstant_0_dout1(0);
  EN_B(0) <= xlconstant_0_dout1(0);
  IN1_A <= demultiplexer_1x2_0_IN1;
  IN1_B <= demultiplexer_1x2_1_IN1;
  IN2_A <= demultiplexer_1x2_0_IN2;
  IN2_B <= demultiplexer_1x2_1_IN2;
  btn2_1 <= btn1;
  btn2_2 <= btn2;
  btn3_1 <= btn3;
  btn_1 <= btn0;
  clk_1 <= clk;
  led0 <= demultiplexer_1x2_0_IN1;
  led1 <= demultiplexer_1x2_0_IN2;
  led2 <= demultiplexer_1x2_1_IN1;
  led3 <= demultiplexer_1x2_1_IN2;
Constant_val_0: component pwm_block_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
Constant_val_1: component pwm_block_xlconstant_0_1
     port map (
      dout(0) => xlconstant_0_dout1(0)
    );
btn_pwn_inc_0: component pwm_block_btn_pwn_inc_0_0
     port map (
      i => btn2_1,
      o(9 downto 0) => btn_pwn_inc_0_o(9 downto 0)
    );
btn_pwn_inc_1: component pwm_block_btn_pwn_inc_1_0
     port map (
      i => btn3_1,
      o(9 downto 0) => btn_pwn_inc_1_o(9 downto 0)
    );
clk_divider_0: component pwm_block_clk_divider_0_1
     port map (
      clk => clk_1,
      clk_out => clk_divider_0_clk_out
    );
comparator_0: component pwm_block_comparator_0_1
     port map (
      a(9 downto 0) => counter_0_cnt(9 downto 0),
      b(9 downto 0) => btn_pwn_inc_0_o(9 downto 0),
      y => comparator_0_y
    );
comparator_1: component pwm_block_comparator_1_0
     port map (
      a(9 downto 0) => counter_1_cnt(9 downto 0),
      b(9 downto 0) => btn_pwn_inc_1_o(9 downto 0),
      y => comparator_1_y
    );
counter_0: component pwm_block_counter_0_0
     port map (
      clk => clk_divider_0_clk_out,
      cnt(9 downto 0) => counter_0_cnt(9 downto 0),
      en => xlconstant_0_dout1(0),
      rst => xlconstant_0_dout(0)
    );
counter_1: component pwm_block_counter_1_0
     port map (
      clk => clk_divider_0_clk_out,
      cnt(9 downto 0) => counter_1_cnt(9 downto 0),
      en => xlconstant_0_dout1(0),
      rst => xlconstant_0_dout(0)
    );
d_latch_0: component pwm_block_d_latch_0_0
     port map (
      i_btn => btn_1,
      o => d_latch_0_o
    );
d_latch_1: component pwm_block_d_latch_1_0
     port map (
      i_btn => btn2_2,
      o => d_latch_1_o
    );
demultiplexer_1x2_0: component pwm_block_demultiplexer_1x2_0_0
     port map (
      IN1 => demultiplexer_1x2_0_IN1,
      IN2 => demultiplexer_1x2_0_IN2,
      i => comparator_0_y,
      s => d_latch_0_o
    );
demultiplexer_1x2_1: component pwm_block_demultiplexer_1x2_1_0
     port map (
      IN1 => demultiplexer_1x2_1_IN1,
      IN2 => demultiplexer_1x2_1_IN2,
      i => comparator_1_y,
      s => d_latch_1_o
    );
end STRUCTURE;
