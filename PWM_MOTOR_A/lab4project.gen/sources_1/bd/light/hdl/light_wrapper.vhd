--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Wed Mar 20 14:20:30 2024
--Host        : Amh2 running 64-bit major release  (build 9200)
--Command     : generate_target light_wrapper.bd
--Design      : light_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity light_wrapper is
  port (
    btn : in STD_LOGIC;
    led : out STD_LOGIC
  );
end light_wrapper;

architecture STRUCTURE of light_wrapper is
  component light is
  port (
    btn : in STD_LOGIC;
    led : out STD_LOGIC
  );
  end component light;
begin
light_i: component light
     port map (
      btn => btn,
      led => led
    );
end STRUCTURE;
