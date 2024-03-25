----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2024 02:59:07 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    generic(
        n_bits : POSITIVE := 10
    );
    Port ( a : in STD_LOGIC_VECTOR(n_bits-1 downto 0);
           b : in STD_LOGIC_VECTOR(n_bits-1 downto 0);
           y : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
    signal  a_temp, b_temp :   UNSIGNED(n_bits-1 downto 0) :=  (others => '0');
begin
    a_temp <= UNSIGNED(a);
    b_temp <= UNSIGNED(b);
    
    process(a,b)
    begin
        if (a > b) then 
            y <= '1';
        else 
            y <= '0';
        end if;
    end process;
end Behavioral;
