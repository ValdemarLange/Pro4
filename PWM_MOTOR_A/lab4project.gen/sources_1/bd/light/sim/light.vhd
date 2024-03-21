--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Wed Mar 20 14:20:30 2024
--Host        : Amh2 running 64-bit major release  (build 9200)
--Command     : generate_target light.bd
--Design      : light
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity light is
  port (
    btn : in STD_LOGIC;
    led : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of light : entity is "light,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=light,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=0,numReposBlks=0,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of light : entity is "light.hwdef";
end light;

architecture STRUCTURE of light is
  signal btn_1 : STD_LOGIC;
begin
  btn_1 <= btn;
  led <= btn_1;
end STRUCTURE;
