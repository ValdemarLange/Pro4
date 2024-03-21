-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Thu Mar 21 11:27:50 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab4/lab4project.gen/sources_1/bd/pwm_block/ip/pwm_block_d_latch_0_0/pwm_block_d_latch_0_0_stub.vhdl
-- Design      : pwm_block_d_latch_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm_block_d_latch_0_0 is
  Port ( 
    i_btn : in STD_LOGIC;
    o : out STD_LOGIC
  );

end pwm_block_d_latch_0_0;

architecture stub of pwm_block_d_latch_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_btn,o";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "d_latch,Vivado 2023.2.2";
begin
end;
