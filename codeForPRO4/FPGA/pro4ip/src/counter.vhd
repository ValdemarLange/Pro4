----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2024 21:44:30
-- Design Name: 
-- Module Name: counter - Behavioral
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
entity counter is
    generic (n : integer := 8);

    Port ( clk : in STD_LOGIC;
           --rst : in STD_LOGIC;
           en : in STD_LOGIC;
           cnt : out STD_LOGIC_VECTOR (n-1 downto 0));
end counter;

architecture Behavioral of counter is
    signal counter_value : STD_LOGIC_VECTOR (n-1 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if rising_edge(clk) and en = '1' then
            --if rst = '1' then
            --    counter_value <= (others => '0');
            --else
                counter_value <= std_logic_vector(unsigned(counter_value) + 1);
                
            --end if;
        end if;
    end process;

    cnt <= counter_value;
end Behavioral;
