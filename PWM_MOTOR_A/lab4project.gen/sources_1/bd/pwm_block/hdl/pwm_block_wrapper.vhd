--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Thu Mar 21 14:01:41 2024
--Host        : Amh2 running 64-bit major release  (build 9200)
--Command     : generate_target pwm_block_wrapper.bd
--Design      : pwm_block_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pwm_block_wrapper is
  port (
    EN_A : out STD_LOGIC_VECTOR ( 0 to 0 );
    IN1_A : out STD_LOGIC;
    IN2_A : out STD_LOGIC;
    btn : in STD_LOGIC;
    btn2 : in STD_LOGIC;
    clk : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC
  );
end pwm_block_wrapper;

architecture STRUCTURE of pwm_block_wrapper is
  component pwm_block is
  port (
    clk : in STD_LOGIC;
    btn : in STD_LOGIC;
    led_0 : out STD_LOGIC;
    led_1 : out STD_LOGIC;
    IN1_A : out STD_LOGIC;
    IN2_A : out STD_LOGIC;
    EN_A : out STD_LOGIC_VECTOR ( 0 to 0 );
    btn2 : in STD_LOGIC
  );
  end component pwm_block;
begin
pwm_block_i: component pwm_block
     port map (
      EN_A(0) => EN_A(0),
      IN1_A => IN1_A,
      IN2_A => IN2_A,
      btn => btn,
      btn2 => btn2,
      clk => clk,
      led_0 => led_0,
      led_1 => led_1
    );
end STRUCTURE;
