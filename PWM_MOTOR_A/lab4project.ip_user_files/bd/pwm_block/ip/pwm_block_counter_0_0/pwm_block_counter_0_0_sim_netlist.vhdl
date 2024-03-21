-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Thu Mar 21 13:36:59 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_counter_0_0/pwm_block_counter_0_0_sim_netlist.vhdl
-- Design      : pwm_block_counter_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_counter_0_0_counter is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    en : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_block_counter_0_0_counter : entity is "counter";
end pwm_block_counter_0_0_counter;

architecture STRUCTURE of pwm_block_counter_0_0_counter is
  signal \cnt_int[9]_i_2_n_0\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_int[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt_int[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt_int[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_int[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_int[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt_int[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt_int[8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_int[9]_i_1\ : label is "soft_lutpair0";
begin
  \out\(9 downto 0) <= \^out\(9 downto 0);
\cnt_int[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^out\(0),
      O => p_0_in(0)
    );
\cnt_int[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      O => p_0_in(1)
    );
\cnt_int[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      I2 => \^out\(2),
      O => p_0_in(2)
    );
\cnt_int[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => \^out\(2),
      I3 => \^out\(3),
      O => p_0_in(3)
    );
\cnt_int[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^out\(2),
      I1 => \^out\(0),
      I2 => \^out\(1),
      I3 => \^out\(3),
      I4 => \^out\(4),
      O => p_0_in(4)
    );
\cnt_int[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^out\(3),
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => \^out\(2),
      I4 => \^out\(4),
      I5 => \^out\(5),
      O => p_0_in(5)
    );
\cnt_int[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cnt_int[9]_i_2_n_0\,
      I1 => \^out\(6),
      O => p_0_in(6)
    );
\cnt_int[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \cnt_int[9]_i_2_n_0\,
      I1 => \^out\(6),
      I2 => \^out\(7),
      O => p_0_in(7)
    );
\cnt_int[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^out\(6),
      I1 => \cnt_int[9]_i_2_n_0\,
      I2 => \^out\(7),
      I3 => \^out\(8),
      O => p_0_in(8)
    );
\cnt_int[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^out\(7),
      I1 => \cnt_int[9]_i_2_n_0\,
      I2 => \^out\(6),
      I3 => \^out\(8),
      I4 => \^out\(9),
      O => p_0_in(9)
    );
\cnt_int[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^out\(5),
      I1 => \^out\(3),
      I2 => \^out\(1),
      I3 => \^out\(0),
      I4 => \^out\(2),
      I5 => \^out\(4),
      O => \cnt_int[9]_i_2_n_0\
    );
\cnt_int_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(0),
      Q => \^out\(0)
    );
\cnt_int_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(1),
      Q => \^out\(1)
    );
\cnt_int_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(2),
      Q => \^out\(2)
    );
\cnt_int_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(3),
      Q => \^out\(3)
    );
\cnt_int_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(4),
      Q => \^out\(4)
    );
\cnt_int_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(5),
      Q => \^out\(5)
    );
\cnt_int_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(6),
      Q => \^out\(6)
    );
\cnt_int_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(7),
      Q => \^out\(7)
    );
\cnt_int_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(8),
      Q => \^out\(8)
    );
\cnt_int_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => en,
      CLR => rst,
      D => p_0_in(9),
      Q => \^out\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_counter_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_block_counter_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_block_counter_0_0 : entity is "pwm_block_counter_0_0,counter,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_block_counter_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_block_counter_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_block_counter_0_0 : entity is "counter,Vivado 2023.2.2";
end pwm_block_counter_0_0;

architecture STRUCTURE of pwm_block_counter_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.pwm_block_counter_0_0_counter
     port map (
      clk => clk,
      en => en,
      \out\(9 downto 0) => cnt(9 downto 0),
      rst => rst
    );
end STRUCTURE;
