----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2021 02:32:26 PM
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
    generic(
        n_bits  :   POSITIVE    :=  10
    );
    port(
        clk     :   in  STD_LOGIC;
        rst     :   in  STD_LOGIC;
        en      :   in  STD_LOGIC;
        cnt     :   out STD_LOGIC_VECTOR(n_bits-1 downto 0)
    );
end counter;

architecture Behavioral of counter is
    signal  cnt_int :   UNSIGNED(n_bits-1 downto 0) :=  (others => '0');
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            cnt_int     <=  (others => '0');
        elsif(rising_edge(clk)) then
            if (en = '1') then
--                if (cnt_int = 99) then
--                    cnt_int <=  (others => '0');
--                else 
                    cnt_int <=  cnt_int + "1";
--                end if;
            end if;
        end if;
    end process;

    cnt <=  STD_LOGIC_VECTOR(cnt_int);
end Behavioral;
