----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2024 15:02:47
-- Design Name: 
-- Module Name: is_larger_comparator - Behavioral
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

entity is_larger_comparator is
    generic (n : integer := 8);

    Port ( a : in STD_LOGIC_VECTOR(n-1 downto 0);
           b : in STD_LOGIC_VECTOR(n-1 downto 0);
           y : out STD_LOGIC);
end is_larger_comparator;

architecture Behavioral of is_larger_comparator is

begin

process (a,b)
begin
    if (a >= b) then y <= '1';
    else y <= '0';
    end if;
end process;

end Behavioral;
