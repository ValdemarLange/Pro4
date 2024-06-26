-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Wed May  8 15:03:11 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab9/lab9project.gen/sources_1/bd/uart_block/ip/uart_block_rx_mod_0_0/uart_block_rx_mod_0_0_sim_netlist.vhdl
-- Design      : uart_block_rx_mod_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uart_block_rx_mod_0_0_rx_mod is
  port (
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    intr : out STD_LOGIC;
    sin : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of uart_block_rx_mod_0_0_rx_mod : entity is "rx_mod";
end uart_block_rx_mod_0_0_rx_mod;

architecture STRUCTURE of uart_block_rx_mod_0_0_rx_mod is
  signal count : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \^data_out\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 8 to 8 );
  signal p_1_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal rxin : STD_LOGIC;
  signal rxmt : STD_LOGIC;
  signal rxmt0 : STD_LOGIC;
  signal rxmt_i_1_n_0 : STD_LOGIC;
  signal \rxreg[8]_i_1_n_0\ : STD_LOGIC;
  signal \rxreg[8]_i_3_n_0\ : STD_LOGIC;
  signal \rxreg_reg_n_0_[0]\ : STD_LOGIC;
  signal start_flag_i_1_n_0 : STD_LOGIC;
  signal start_flag_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of intr_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rxreg[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rxreg[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \rxreg[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rxreg[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \rxreg[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rxreg[5]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \rxreg[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rxreg[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rxreg[8]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rxreg[9]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of start_flag_i_1 : label is "soft_lutpair1";
begin
  data_out(7 downto 0) <= \^data_out\(7 downto 0);
\count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => count(0),
      I1 => rxin,
      I2 => rxmt,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6066"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      I2 => rxin,
      I3 => rxmt,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0BBBB000"
    )
        port map (
      I0 => rxin,
      I1 => rxmt,
      I2 => count(0),
      I3 => count(1),
      I4 => count(2),
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5511AA20"
    )
        port map (
      I0 => \rxreg[8]_i_3_n_0\,
      I1 => rxmt,
      I2 => start_flag_reg_n_0,
      I3 => rxin,
      I4 => count(3),
      O => \count[3]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[0]_i_1_n_0\,
      Q => count(0)
    );
\count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[1]_i_1_n_0\,
      Q => count(1)
    );
\count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[2]_i_1_n_0\,
      Q => count(2)
    );
\count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => \count[3]_i_1_n_0\,
      Q => count(3)
    );
intr_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \rxreg_reg_n_0_[0]\,
      I1 => p_0_in(8),
      I2 => rxmt,
      O => rxmt0
    );
intr_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => rxmt0,
      Q => intr
    );
rxin_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => sin,
      PRE => rst,
      Q => rxin
    );
rxmt_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => rxin,
      I1 => rxmt,
      I2 => p_0_in(8),
      I3 => \rxreg_reg_n_0_[0]\,
      O => rxmt_i_1_n_0
    );
rxmt_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => rxmt_i_1_n_0,
      PRE => rst,
      Q => rxmt
    );
\rxreg[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(0),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(0)
    );
\rxreg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(1),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(1)
    );
\rxreg[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(2),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(2)
    );
\rxreg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(3),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(3)
    );
\rxreg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(4),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(4)
    );
\rxreg[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(5),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(5)
    );
\rxreg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(6),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(6)
    );
\rxreg[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^data_out\(7),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(7)
    );
\rxreg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3333F100"
    )
        port map (
      I0 => start_flag_reg_n_0,
      I1 => rxin,
      I2 => count(3),
      I3 => \rxreg[8]_i_3_n_0\,
      I4 => rxmt,
      O => \rxreg[8]_i_1_n_0\
    );
\rxreg[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => p_0_in(8),
      I1 => rxin,
      I2 => rxmt,
      O => p_1_in(8)
    );
\rxreg[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => count(2),
      I1 => count(1),
      I2 => count(0),
      O => \rxreg[8]_i_3_n_0\
    );
\rxreg[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rxmt,
      I1 => rxin,
      O => p_1_in(9)
    );
\rxreg_reg[0]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(0),
      PRE => rst,
      Q => \rxreg_reg_n_0_[0]\
    );
\rxreg_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(1),
      PRE => rst,
      Q => \^data_out\(0)
    );
\rxreg_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(2),
      PRE => rst,
      Q => \^data_out\(1)
    );
\rxreg_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(3),
      PRE => rst,
      Q => \^data_out\(2)
    );
\rxreg_reg[4]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(4),
      PRE => rst,
      Q => \^data_out\(3)
    );
\rxreg_reg[5]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(5),
      PRE => rst,
      Q => \^data_out\(4)
    );
\rxreg_reg[6]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(6),
      PRE => rst,
      Q => \^data_out\(5)
    );
\rxreg_reg[7]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(7),
      PRE => rst,
      Q => \^data_out\(6)
    );
\rxreg_reg[8]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(8),
      PRE => rst,
      Q => \^data_out\(7)
    );
\rxreg_reg[9]\: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => \rxreg[8]_i_1_n_0\,
      D => p_1_in(9),
      PRE => rst,
      Q => p_0_in(8)
    );
start_flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F1C0F0"
    )
        port map (
      I0 => count(3),
      I1 => rxin,
      I2 => start_flag_reg_n_0,
      I3 => rxmt,
      I4 => \rxreg[8]_i_3_n_0\,
      O => start_flag_i_1_n_0
    );
start_flag_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => rst,
      D => start_flag_i_1_n_0,
      Q => start_flag_reg_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uart_block_rx_mod_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    sin : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    intr : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of uart_block_rx_mod_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of uart_block_rx_mod_0_0 : entity is "uart_block_rx_mod_0_0,rx_mod,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of uart_block_rx_mod_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of uart_block_rx_mod_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of uart_block_rx_mod_0_0 : entity is "rx_mod,Vivado 2023.2.2";
end uart_block_rx_mod_0_0;

architecture STRUCTURE of uart_block_rx_mod_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN uart_block_clk, INSERT_VIP 0";
  attribute x_interface_info of intr : signal is "xilinx.com:signal:interrupt:1.0 intr INTERRUPT";
  attribute x_interface_parameter of intr : signal is "XIL_INTERFACENAME intr, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  attribute x_interface_info of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_parameter of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.uart_block_rx_mod_0_0_rx_mod
     port map (
      clk => clk,
      data_out(7 downto 0) => data_out(7 downto 0),
      intr => intr,
      rst => rst,
      sin => sin
    );
end STRUCTURE;
