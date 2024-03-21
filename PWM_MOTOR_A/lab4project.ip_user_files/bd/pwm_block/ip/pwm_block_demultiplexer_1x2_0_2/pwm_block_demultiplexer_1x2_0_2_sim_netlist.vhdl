-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Thu Mar 21 10:12:49 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_demultiplexer_1x2_0_2/pwm_block_demultiplexer_1x2_0_2_sim_netlist.vhdl
-- Design      : pwm_block_demultiplexer_1x2_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_demultiplexer_1x2_0_2 is
  port (
    i : in STD_LOGIC;
    s : in STD_LOGIC;
    IN1 : out STD_LOGIC;
    IN2 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of pwm_block_demultiplexer_1x2_0_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of pwm_block_demultiplexer_1x2_0_2 : entity is "pwm_block_demultiplexer_1x2_0_2,demultiplexer_1x2,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of pwm_block_demultiplexer_1x2_0_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of pwm_block_demultiplexer_1x2_0_2 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of pwm_block_demultiplexer_1x2_0_2 : entity is "demultiplexer_1x2,Vivado 2023.2.2";
end pwm_block_demultiplexer_1x2_0_2;

architecture STRUCTURE of pwm_block_demultiplexer_1x2_0_2 is
begin
IN1_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => i,
      I1 => s,
      O => IN1
    );
IN2_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s,
      I1 => i,
      O => IN2
    );
end STRUCTURE;
