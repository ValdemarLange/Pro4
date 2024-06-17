----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 11:07:58 AM
-- Design Name: 
-- Module Name: Homing_hall_sensor - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Homing_hall_sensor is
    Port (  rst         : in std_logic;
            tilt_Hall : in STD_LOGIC;
            pan_Hall : in STD_LOGIC;
            tilt_out : out STD_LOGIC := '1';
            pan_out : out STD_LOGIC := '1'
            ) ;
end Homing_hall_sensor;

architecture Behavioral of Homing_hall_sensor is

begin
    process(rst, tilt_Hall, pan_Hall)
    begin
    if(rst = '1') then
        tilt_out <= '1';
        pan_out <= '1';
    end if;
    
    if(tilt_Hall = '0') then
        tilt_out <= '0';
    end if;
    
    if(pan_Hall = '0') then
        pan_out <= '0';
    end if;
    
    end process;
end Behavioral;



