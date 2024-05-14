--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Tue May 14 15:28:48 2024
--Host        : Amh2 running 64-bit major release  (build 9200)
--Command     : generate_target uart_block_wrapper.bd
--Design      : uart_block_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uart_block_wrapper is
  port (
    btn0 : in STD_LOGIC;
    clk : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 );
    txd : in STD_LOGIC
  );
end uart_block_wrapper;

architecture STRUCTURE of uart_block_wrapper is
  component uart_block is
  port (
    clk : in STD_LOGIC;
    btn0 : in STD_LOGIC;
    txd : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component uart_block;
begin
uart_block_i: component uart_block
     port map (
      btn0 => btn0,
      clk => clk,
      led(7 downto 0) => led(7 downto 0),
      txd => txd
    );
end STRUCTURE;
