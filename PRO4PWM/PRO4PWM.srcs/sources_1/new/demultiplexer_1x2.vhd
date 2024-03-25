----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2024 01:35:00 PM
-- Design Name: 
-- Module Name: demultiplexer_1x2 - Behavioral
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

entity demultiplexer_1x2 is
    Port ( i : in STD_LOGIC;
           s : in STD_LOGIC;
           IN1 : out STD_LOGIC;
           IN2 : out STD_LOGIC
           );
end demultiplexer_1x2;

architecture Behavioral of demultiplexer_1x2 is
begin
    process (i, s)
    begin 
        if(s = '0') then 
            IN1 <= i;
            IN2 <= '0';
        elsif(s = '1') then 
            IN1 <= '0';
            IN2 <= i;
        end if;
    end process;
end Behavioral;
