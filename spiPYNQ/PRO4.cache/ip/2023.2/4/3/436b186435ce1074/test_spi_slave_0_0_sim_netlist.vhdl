-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Thu Mar 21 12:47:12 2024
-- Host        : madsxps running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ test_spi_slave_0_0_sim_netlist.vhdl
-- Design      : test_spi_slave_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_slave is
  port (
    o_busy : out STD_LOGIC;
    o_data_parallel : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ck_miso : out STD_LOGIC;
    i_data_parallel : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ck_sck : in STD_LOGIC;
    ck_ss : in STD_LOGIC;
    ck_mosi : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_slave;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_slave is
  signal ck_miso_i_1_n_0 : STD_LOGIC;
  signal \^o_busy\ : STD_LOGIC;
  signal \^o_data_parallel\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal p_0_in_0 : STD_LOGIC;
  signal \r_tx_data[0]_i_1_n_0\ : STD_LOGIC;
  signal \r_tx_data[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_tx_data[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_tx_data[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_tx_data[4]_i_1_n_0\ : STD_LOGIC;
  signal \r_tx_data[5]_i_1_n_0\ : STD_LOGIC;
  signal \r_tx_data[6]_i_1_n_0\ : STD_LOGIC;
  signal \r_tx_data_reg_n_0_[0]\ : STD_LOGIC;
  signal \r_tx_data_reg_n_0_[1]\ : STD_LOGIC;
  signal \r_tx_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \r_tx_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \r_tx_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \r_tx_data_reg_n_0_[5]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ck_miso_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \r_tx_data[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_tx_data[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_tx_data[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r_tx_data[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \r_tx_data[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_tx_data[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_tx_data[6]_i_1\ : label is "soft_lutpair3";
begin
  o_busy <= \^o_busy\;
  o_data_parallel(7 downto 0) <= \^o_data_parallel\(7 downto 0);
ck_miso_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_0_in_0,
      I1 => \^o_busy\,
      I2 => i_data_parallel(7),
      O => ck_miso_i_1_n_0
    );
ck_miso_reg: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => ck_miso_i_1_n_0,
      Q => ck_miso,
      R => '0'
    );
\r_rx_data[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ck_ss,
      O => p_0_in
    );
\r_rx_data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => ck_mosi,
      Q => \^o_data_parallel\(0),
      R => '0'
    );
\r_rx_data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => \^o_data_parallel\(0),
      Q => \^o_data_parallel\(1),
      R => '0'
    );
\r_rx_data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => \^o_data_parallel\(1),
      Q => \^o_data_parallel\(2),
      R => '0'
    );
\r_rx_data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => \^o_data_parallel\(2),
      Q => \^o_data_parallel\(3),
      R => '0'
    );
\r_rx_data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => \^o_data_parallel\(3),
      Q => \^o_data_parallel\(4),
      R => '0'
    );
\r_rx_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => \^o_data_parallel\(4),
      Q => \^o_data_parallel\(5),
      R => '0'
    );
\r_rx_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => \^o_data_parallel\(5),
      Q => \^o_data_parallel\(6),
      R => '0'
    );
\r_rx_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => ck_sck,
      CE => p_0_in,
      D => \^o_data_parallel\(6),
      Q => \^o_data_parallel\(7),
      R => '0'
    );
r_shift_ena_reg: unisim.vcomponents.FDCE
     port map (
      C => ck_sck,
      CE => '1',
      CLR => ck_ss,
      D => '1',
      Q => \^o_busy\
    );
\r_tx_data[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => i_data_parallel(0),
      I1 => \^o_busy\,
      O => \r_tx_data[0]_i_1_n_0\
    );
\r_tx_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_tx_data_reg_n_0_[0]\,
      I1 => \^o_busy\,
      I2 => i_data_parallel(1),
      O => \r_tx_data[1]_i_1_n_0\
    );
\r_tx_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_tx_data_reg_n_0_[1]\,
      I1 => \^o_busy\,
      I2 => i_data_parallel(2),
      O => \r_tx_data[2]_i_1_n_0\
    );
\r_tx_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_tx_data_reg_n_0_[2]\,
      I1 => \^o_busy\,
      I2 => i_data_parallel(3),
      O => \r_tx_data[3]_i_1_n_0\
    );
\r_tx_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_tx_data_reg_n_0_[3]\,
      I1 => \^o_busy\,
      I2 => i_data_parallel(4),
      O => \r_tx_data[4]_i_1_n_0\
    );
\r_tx_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_tx_data_reg_n_0_[4]\,
      I1 => \^o_busy\,
      I2 => i_data_parallel(5),
      O => \r_tx_data[5]_i_1_n_0\
    );
\r_tx_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \r_tx_data_reg_n_0_[5]\,
      I1 => \^o_busy\,
      I2 => i_data_parallel(6),
      O => \r_tx_data[6]_i_1_n_0\
    );
\r_tx_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => \r_tx_data[0]_i_1_n_0\,
      Q => \r_tx_data_reg_n_0_[0]\,
      R => '0'
    );
\r_tx_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => \r_tx_data[1]_i_1_n_0\,
      Q => \r_tx_data_reg_n_0_[1]\,
      R => '0'
    );
\r_tx_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => \r_tx_data[2]_i_1_n_0\,
      Q => \r_tx_data_reg_n_0_[2]\,
      R => '0'
    );
\r_tx_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => \r_tx_data[3]_i_1_n_0\,
      Q => \r_tx_data_reg_n_0_[3]\,
      R => '0'
    );
\r_tx_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => \r_tx_data[4]_i_1_n_0\,
      Q => \r_tx_data_reg_n_0_[4]\,
      R => '0'
    );
\r_tx_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => \r_tx_data[5]_i_1_n_0\,
      Q => \r_tx_data_reg_n_0_[5]\,
      R => '0'
    );
\r_tx_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ck_sck,
      CE => p_0_in,
      D => \r_tx_data[6]_i_1_n_0\,
      Q => p_0_in_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    o_busy : out STD_LOGIC;
    i_data_parallel : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_data_parallel : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ck_sck : in STD_LOGIC;
    ck_ss : in STD_LOGIC;
    ck_mosi : in STD_LOGIC;
    ck_miso : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "test_spi_slave_0_0,spi_slave,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "spi_slave,Vivado 2023.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spi_slave
     port map (
      ck_miso => ck_miso,
      ck_mosi => ck_mosi,
      ck_sck => ck_sck,
      ck_ss => ck_ss,
      i_data_parallel(7 downto 0) => i_data_parallel(7 downto 0),
      o_busy => o_busy,
      o_data_parallel(7 downto 0) => o_data_parallel(7 downto 0)
    );
end STRUCTURE;
