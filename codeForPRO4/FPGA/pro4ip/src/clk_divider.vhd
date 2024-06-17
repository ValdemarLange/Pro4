-------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2024 07:06:13 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

entity clock_divider is
    generic(
        pwm_count : positive := 610
    );
    Port ( pynq_clock : in STD_LOGIC;
           --desired_hz : in STD_LOGIC_VECTOR(7 downto 0;
           output_clock : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
    signal cnt_temp : integer range 0 to 2500 := 0; 
    signal output_temp : std_logic; 
    --constant desired_number_hz : integer := 125000000 /(255 * desired_hz *2);
    
begin
    process(pynq_clock)
    begin
        if(rising_edge(pynq_clock)) then
            if (cnt_temp = 2250) then -- ved en st?rrelse p? 2500Hz
                output_temp <= not(output_temp);
                cnt_temp <= 0;
             else
                cnt_temp <= cnt_temp + 1;
             end if;
         end if;
    end process;
    output_clock <= output_temp;
end Behavioral;