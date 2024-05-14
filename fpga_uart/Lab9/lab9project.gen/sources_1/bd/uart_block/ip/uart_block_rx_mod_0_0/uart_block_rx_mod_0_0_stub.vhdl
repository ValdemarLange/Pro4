-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Wed May  8 15:03:11 2024
-- Host        : Amh2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/aksel/OneDrive/Skrivebord/4-semester/DigitalProgrammerbarElektronik/Lab9/lab9project.gen/sources_1/bd/uart_block/ip/uart_block_rx_mod_0_0/uart_block_rx_mod_0_0_stub.vhdl
-- Design      : uart_block_rx_mod_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_block_rx_mod_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    sin : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    intr : out STD_LOGIC
  );

end uart_block_rx_mod_0_0;

architecture stub of uart_block_rx_mod_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,sin,data_out[7:0],intr";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "rx_mod,Vivado 2023.2.2";
begin
end;
