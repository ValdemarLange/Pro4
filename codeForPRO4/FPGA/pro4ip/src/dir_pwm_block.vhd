----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2024 08:06:47
-- Design Name: 
-- Module Name: dir_pwm_block - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dir_pwm_block is
    Port (
        motor_sel : in STD_LOGIC;
        dir_sel   : in STD_LOGIC;
        pwm_pan   : in STD_LOGIC;
        pwm_tilt  : in STD_LOGIC;
        IN1_pan   : out STD_LOGIC;
        IN2_pan   : out STD_LOGIC;
        IN1_tilt  : out STD_LOGIC;
        IN2_tilt  : out STD_LOGIC
     );
end dir_pwm_block;

architecture Behavioral of dir_pwm_block is

begin

process(motor_sel, dir_sel, pwm_pan, pwm_tilt)
begin
    if motor_sel = '1' then
        if dir_sel = '1' then
            IN1_tilt <= pwm_tilt;
            IN2_tilt <= '0';
        else
            IN1_tilt <= '0';
            IN2_tilt <= pwm_tilt;
        end if;
    elsif motor_sel = '0' then
        if dir_sel = '1' then
            IN1_pan <= pwm_pan;
            IN2_pan <= '0';
        else
            IN1_pan <= '0';
            IN2_pan <= pwm_pan;
        end if;
    end if;
end process;


end Behavioral;
