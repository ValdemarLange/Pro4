----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2024 16:34:00
-- Design Name: 
-- Module Name: delay - Behavioral
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

entity delay is
    Port (
        inp : in STD_LOGIC_VECTOR(11 downto 0);
        clock : in STD_LOGIC;
        outp : out STD_LOGIC_VECTOR(11 downto 0)
     );
end delay;

architecture Behavioral of delay is
    signal cnt : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');

begin
process(clock)
begin
    if(rising_edge(clock)) then
        cnt <= std_logic_vector(unsigned(cnt) + 1);
        if (cnt = "111") then
            outp <= inp;
            
        end if;
        
    end if;

end process;

end Behavioral;
