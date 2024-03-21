-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Thu Mar 21 12:47:12 2024
-- Host        : madsxps running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ test_spi_slave_0_0_stub.vhdl
-- Design      : test_spi_slave_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    o_busy : out STD_LOGIC;
    i_data_parallel : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_data_parallel : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ck_sck : in STD_LOGIC;
    ck_ss : in STD_LOGIC;
    ck_mosi : in STD_LOGIC;
    ck_miso : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "o_busy,i_data_parallel[7:0],o_data_parallel[7:0],ck_sck,ck_ss,ck_mosi,ck_miso";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "spi_slave,Vivado 2023.2";
begin
end;
