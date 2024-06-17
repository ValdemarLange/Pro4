----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2024 04:44:46 PM
-- Design Name: 
-- Module Name: encoder_decider - Behavioral
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

entity encoder_decider is
    generic( n_bits : positive := 12
    );
    Port (  intr        :   in std_logic;
            data_out    :   out std_logic_vector(n_bits-1 downto 0);
            tilt_motor  :   in std_logic_vector(n_bits-2 downto 0);
            pan_motor   :   in std_logic_vector(n_bits-2 downto 0)
    );
end encoder_decider;

architecture Behavioral of encoder_decider is
signal MSB_decider : std_logic := '1';

begin
    process(intr)
    begin
    if(rising_edge(intr)) then
        if(MSB_decider = '1') then
            data_out(n_bits-1) <= '1';
            data_out(n_bits-2 downto 0) <= tilt_motor;
        elsif(MSB_decider = '0') then
            data_out(n_bits-1) <= '0';
            data_out(n_bits-2 downto 0) <= pan_motor;
        end if;
        MSB_decider <= not(MSB_decider);   -- switch to the other encoder
        
    end if;
    end process;

end Behavioral;
