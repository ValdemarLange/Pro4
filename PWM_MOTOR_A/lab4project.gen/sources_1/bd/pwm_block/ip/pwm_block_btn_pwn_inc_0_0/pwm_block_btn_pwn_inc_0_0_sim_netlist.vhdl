-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Thu Mar 21 14:02:24 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_btn_pwn_inc_0_0/pwm_block_btn_pwn_inc_0_0_sim_netlist.vhdl
-- Design      : pwm_block_btn_pwn_inc_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_btn_pwn_inc_0_0_btn_pwn_inc is
  port (
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_block_btn_pwn_inc_0_0_btn_pwn_inc : entity is "btn_pwn_inc";
end pwm_block_btn_pwn_inc_0_0_btn_pwn_inc;

architecture STRUCTURE of pwm_block_btn_pwn_inc_0_0_btn_pwn_inc is
  signal \^q\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \output_temp[2]_i_1_n_0\ : STD_LOGIC;
  signal \output_temp[5]_i_1_n_0\ : STD_LOGIC;
  signal \output_temp[6]_i_1_n_0\ : STD_LOGIC;
  signal \output_temp[9]_i_2_n_0\ : STD_LOGIC;
  signal \output_temp[9]_i_3_n_0\ : STD_LOGIC;
  signal \output_temp[9]_i_4_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 9 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \output_temp[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \output_temp[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \output_temp[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output_temp[5]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output_temp[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \output_temp[8]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output_temp[9]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output_temp[9]_i_4\ : label is "soft_lutpair2";
begin
  Q(8 downto 0) <= \^q\(8 downto 0);
\output_temp[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => plusOp(1)
    );
\output_temp[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \output_temp[2]_i_1_n_0\
    );
\output_temp[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      O => plusOp(3)
    );
\output_temp[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1FE0"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => plusOp(4)
    );
\output_temp[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A80057FF"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \output_temp[5]_i_1_n_0\
    );
\output_temp[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEAAAAA11155555"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(5),
      O => \output_temp[6]_i_1_n_0\
    );
\output_temp[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \output_temp[9]_i_3_n_0\,
      I1 => \^q\(6),
      O => plusOp(7)
    );
\output_temp[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \output_temp[9]_i_3_n_0\,
      I1 => \^q\(6),
      I2 => \^q\(7),
      O => plusOp(8)
    );
\output_temp[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(6),
      I1 => \output_temp[9]_i_3_n_0\,
      I2 => \^q\(7),
      I3 => \^q\(8),
      O => plusOp(9)
    );
\output_temp[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      I2 => \^q\(2),
      I3 => \^q\(3),
      I4 => \output_temp[9]_i_4_n_0\,
      O => \output_temp[9]_i_2_n_0\
    );
\output_temp[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEEEAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(3),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \^q\(5),
      O => \output_temp[9]_i_3_n_0\
    );
\output_temp[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(6),
      I2 => \^q\(1),
      I3 => \^q\(8),
      O => \output_temp[9]_i_4_n_0\
    );
\output_temp_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => plusOp(1),
      Q => \^q\(0)
    );
\output_temp_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => \output_temp[2]_i_1_n_0\,
      Q => \^q\(1)
    );
\output_temp_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => plusOp(3),
      Q => \^q\(2)
    );
\output_temp_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => plusOp(4),
      Q => \^q\(3)
    );
\output_temp_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => \output_temp[5]_i_1_n_0\,
      Q => \^q\(4)
    );
\output_temp_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => \output_temp[6]_i_1_n_0\,
      Q => \^q\(5)
    );
\output_temp_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => plusOp(7),
      Q => \^q\(6)
    );
\output_temp_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => plusOp(8),
      Q => \^q\(7)
    );
\output_temp_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i,
      CE => '1',
      CLR => \output_temp[9]_i_2_n_0\,
      D => plusOp(9),
      Q => \^q\(8)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_btn_pwn_inc_0_0 is
  port (
    i : in STD_LOGIC;
    o : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_block_btn_pwn_inc_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_block_btn_pwn_inc_0_0 : entity is "pwm_block_btn_pwn_inc_0_0,btn_pwn_inc,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_block_btn_pwn_inc_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_block_btn_pwn_inc_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_block_btn_pwn_inc_0_0 : entity is "btn_pwn_inc,Vivado 2023.2.2";
end pwm_block_btn_pwn_inc_0_0;

architecture STRUCTURE of pwm_block_btn_pwn_inc_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^o\ : STD_LOGIC_VECTOR ( 9 downto 1 );
begin
  o(9 downto 1) <= \^o\(9 downto 1);
  o(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.pwm_block_btn_pwn_inc_0_0_btn_pwn_inc
     port map (
      Q(8 downto 0) => \^o\(9 downto 1),
      i => i
    );
end STRUCTURE;
