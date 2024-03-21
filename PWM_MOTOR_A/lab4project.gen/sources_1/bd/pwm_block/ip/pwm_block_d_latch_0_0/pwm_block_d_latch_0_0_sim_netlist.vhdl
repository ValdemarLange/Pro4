-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Thu Mar 21 11:27:50 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_d_latch_0_0/pwm_block_d_latch_0_0_sim_netlist.vhdl
-- Design      : pwm_block_d_latch_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_d_latch_0_0_d_latch is
  port (
    o : out STD_LOGIC;
    i_btn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of pwm_block_d_latch_0_0_d_latch : entity is "d_latch";
end pwm_block_d_latch_0_0_d_latch;

architecture STRUCTURE of pwm_block_d_latch_0_0_d_latch is
  signal \^o\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
begin
  o <= \^o\;
o_temp_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^o\,
      O => p_0_in
    );
o_temp_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_btn,
      CE => '1',
      D => p_0_in,
      Q => \^o\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_d_latch_0_0 is
  port (
    i_btn : in STD_LOGIC;
    o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_block_d_latch_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_block_d_latch_0_0 : entity is "pwm_block_d_latch_0_0,d_latch,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_block_d_latch_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_block_d_latch_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_block_d_latch_0_0 : entity is "d_latch,Vivado 2023.2.2";
end pwm_block_d_latch_0_0;

architecture STRUCTURE of pwm_block_d_latch_0_0 is
begin
U0: entity work.pwm_block_d_latch_0_0_d_latch
     port map (
      i_btn => i_btn,
      o => o
    );
end STRUCTURE;
