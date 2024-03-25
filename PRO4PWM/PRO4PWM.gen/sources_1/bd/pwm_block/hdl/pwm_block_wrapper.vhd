--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
--Date        : Mon Mar 25 09:54:09 2024
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
    EN_B : out STD_LOGIC_VECTOR ( 0 to 0 );
    IN1_A : out STD_LOGIC;
    IN1_B : out STD_LOGIC;
    IN2_A : out STD_LOGIC;
    IN2_B : out STD_LOGIC;
    btn0 : in STD_LOGIC;
    btn1 : in STD_LOGIC;
    btn2 : in STD_LOGIC;
    btn3 : in STD_LOGIC;
    clk : in STD_LOGIC;
    led0 : out STD_LOGIC;
    led1 : out STD_LOGIC;
    led2 : out STD_LOGIC;
    led3 : out STD_LOGIC
  );
end pwm_block_wrapper;

architecture STRUCTURE of pwm_block_wrapper is
  component pwm_block is
  port (
    clk : in STD_LOGIC;
    btn1 : in STD_LOGIC;
    btn0 : in STD_LOGIC;
    IN1_A : out STD_LOGIC;
    led0 : out STD_LOGIC;
    led1 : out STD_LOGIC;
    IN2_A : out STD_LOGIC;
    EN_A : out STD_LOGIC_VECTOR ( 0 to 0 );
    EN_B : out STD_LOGIC_VECTOR ( 0 to 0 );
    led2 : out STD_LOGIC;
    led3 : out STD_LOGIC;
    IN1_B : out STD_LOGIC;
    IN2_B : out STD_LOGIC;
    btn3 : in STD_LOGIC;
    btn2 : in STD_LOGIC
  );
  end component pwm_block;
begin
pwm_block_i: component pwm_block
     port map (
      EN_A(0) => EN_A(0),
      EN_B(0) => EN_B(0),
      IN1_A => IN1_A,
      IN1_B => IN1_B,
      IN2_A => IN2_A,
      IN2_B => IN2_B,
      btn0 => btn0,
      btn1 => btn1,
      btn2 => btn2,
      btn3 => btn3,
      clk => clk,
      led0 => led0,
      led1 => led1,
      led2 => led2,
      led3 => led3
    );
end STRUCTURE;
