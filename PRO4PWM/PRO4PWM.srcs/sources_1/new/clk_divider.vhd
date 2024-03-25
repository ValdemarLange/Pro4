----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 08:32:12 AM
-- Design Name: 
-- Module Name: clk_divider - Behavioral
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

entity clk_divider is
    Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
    signal counter : UNSIGNED(10 downto 0) := (others => '0');
    signal clk_temp : STD_LOGIC := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if (counter = 610) then
                clk_temp <= not(clk_temp);
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= STD_LOGIC(clk_temp);
end Behavioral;
