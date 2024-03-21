-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Thu Mar 21 13:36:59 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_comparator_0_0/pwm_block_comparator_0_0_sim_netlist.vhdl
-- Design      : pwm_block_comparator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_comparator_0_0_comparator is
  port (
    y : out STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    b : in STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_block_comparator_0_0_comparator : entity is "comparator";
end pwm_block_comparator_0_0_comparator;

architecture STRUCTURE of pwm_block_comparator_0_0_comparator is
  signal y_INST_0_i_10_n_0 : STD_LOGIC;
  signal y_INST_0_i_11_n_0 : STD_LOGIC;
  signal y_INST_0_i_1_n_0 : STD_LOGIC;
  signal y_INST_0_i_1_n_1 : STD_LOGIC;
  signal y_INST_0_i_1_n_2 : STD_LOGIC;
  signal y_INST_0_i_1_n_3 : STD_LOGIC;
  signal y_INST_0_i_2_n_0 : STD_LOGIC;
  signal y_INST_0_i_3_n_0 : STD_LOGIC;
  signal y_INST_0_i_4_n_0 : STD_LOGIC;
  signal y_INST_0_i_5_n_0 : STD_LOGIC;
  signal y_INST_0_i_6_n_0 : STD_LOGIC;
  signal y_INST_0_i_7_n_0 : STD_LOGIC;
  signal y_INST_0_i_8_n_0 : STD_LOGIC;
  signal y_INST_0_i_9_n_0 : STD_LOGIC;
  signal NLW_y_INST_0_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_y_INST_0_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_y_INST_0_i_1_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of y_INST_0 : label is 11;
  attribute COMPARATOR_THRESHOLD of y_INST_0_i_1 : label is 11;
begin
y_INST_0: unisim.vcomponents.CARRY4
     port map (
      CI => y_INST_0_i_1_n_0,
      CO(3 downto 1) => NLW_y_INST_0_CO_UNCONNECTED(3 downto 1),
      CO(0) => y,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => y_INST_0_i_2_n_0,
      O(3 downto 0) => NLW_y_INST_0_O_UNCONNECTED(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => y_INST_0_i_3_n_0
    );
y_INST_0_i_1: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => y_INST_0_i_1_n_0,
      CO(2) => y_INST_0_i_1_n_1,
      CO(1) => y_INST_0_i_1_n_2,
      CO(0) => y_INST_0_i_1_n_3,
      CYINIT => '0',
      DI(3) => y_INST_0_i_4_n_0,
      DI(2) => y_INST_0_i_5_n_0,
      DI(1) => y_INST_0_i_6_n_0,
      DI(0) => y_INST_0_i_7_n_0,
      O(3 downto 0) => NLW_y_INST_0_i_1_O_UNCONNECTED(3 downto 0),
      S(3) => y_INST_0_i_8_n_0,
      S(2) => y_INST_0_i_9_n_0,
      S(1) => y_INST_0_i_10_n_0,
      S(0) => y_INST_0_i_11_n_0
    );
y_INST_0_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => a(2),
      I1 => b(2),
      I2 => a(3),
      I3 => b(3),
      O => y_INST_0_i_10_n_0
    );
y_INST_0_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => a(0),
      I1 => b(0),
      I2 => a(1),
      I3 => b(1),
      O => y_INST_0_i_11_n_0
    );
y_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => a(8),
      I1 => b(8),
      I2 => b(9),
      I3 => a(9),
      O => y_INST_0_i_2_n_0
    );
y_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => a(8),
      I1 => b(8),
      I2 => a(9),
      I3 => b(9),
      O => y_INST_0_i_3_n_0
    );
y_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => a(6),
      I1 => b(6),
      I2 => b(7),
      I3 => a(7),
      O => y_INST_0_i_4_n_0
    );
y_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => a(4),
      I1 => b(4),
      I2 => b(5),
      I3 => a(5),
      O => y_INST_0_i_5_n_0
    );
y_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => a(2),
      I1 => b(2),
      I2 => b(3),
      I3 => a(3),
      O => y_INST_0_i_6_n_0
    );
y_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => a(0),
      I1 => b(0),
      I2 => b(1),
      I3 => a(1),
      O => y_INST_0_i_7_n_0
    );
y_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => a(6),
      I1 => b(6),
      I2 => a(7),
      I3 => b(7),
      O => y_INST_0_i_8_n_0
    );
y_INST_0_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => a(4),
      I1 => b(4),
      I2 => a(5),
      I3 => b(5),
      O => y_INST_0_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_comparator_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    b : in STD_LOGIC_VECTOR ( 9 downto 0 );
    y : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_block_comparator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_block_comparator_0_0 : entity is "pwm_block_comparator_0_0,comparator,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_block_comparator_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_block_comparator_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_block_comparator_0_0 : entity is "comparator,Vivado 2023.2.2";
end pwm_block_comparator_0_0;

architecture STRUCTURE of pwm_block_comparator_0_0 is
begin
U0: entity work.pwm_block_comparator_0_0_comparator
     port map (
      a(9 downto 0) => a(9 downto 0),
      b(9 downto 0) => b(9 downto 0),
      y => y
    );
end STRUCTURE;
