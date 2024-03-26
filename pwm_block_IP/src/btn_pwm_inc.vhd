----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 01:41:18 PM
-- Design Name: 
-- Module Name: btn_pwn_inc - Behavioral
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

entity btn_pwn_inc is
    generic(
        n_bits : POSITIVE := 10
    );
    Port ( i : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR(n_bits-1 downto 0)
           );
end btn_pwn_inc;

architecture Behavioral of btn_pwn_inc is
    signal output_temp : UNSIGNED(n_bits-1 downto 0) := (others => '0');
begin
    process(i)
    begin
        if (rising_edge(i)) then
            output_temp <= output_temp + 102;
        end if;
        if (output_temp > 1019) then
            output_temp <= (others => '0');
        end if;
    end process;
    
    o <= STD_LOGIC_VECTOR(output_temp);
end Behavioral;
