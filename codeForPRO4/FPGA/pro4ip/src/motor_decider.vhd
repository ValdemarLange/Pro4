----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2024 04:16:37 PM
-- Design Name: 
-- Module Name: motor_decider - Behavioral
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

entity motor_decider_tilt is
    generic( n_bits : positive := 12
    );
    Port ( data_inp     : in std_logic_vector(n_bits-1 downto 0);
           en           : in STD_LOGIC;
           tilt_led     : out STD_LOGIC := '0';
           tilt_motor   : out std_logic_vector(7 downto 0)
           --pt_state : out STD_LOGIC
           --pan_motor   : out std_logic_vector(7 downto 0)
    );
end motor_decider_tilt;

architecture Behavioral of motor_decider_tilt is
    --signal tilt_temp : std_logic_vector(7 downto 0) := (others => '0');
    --signal pan_temp : std_logic_vector(7 downto 0) := (others => '0');
    
begin
process (data_inp, en)
begin
if en = '1' then
    tilt_motor <= data_inp(7 downto 0);
    tilt_led <= '1';
else
    tilt_led <= '0';
end if;
end process;
end Behavioral;

--    process(data_inp)
--    begin
--        if data_inp(n_bits-1) = '1' then
--              tilt_temp <= data_inp(7 downto 0);
--        end if;
--        pt_state <= data_inp(n_bits-1);
--    end process; 
--    tilt_motor <= tilt_temp;

--end Behavioral;
   
   
    --pan_motor <= (others => '0');
    
--        if(data_inp(n_bits-1) = '1') then
--            tilt_temp <= data_inp(7 downto 0);
            
--            pt_state <= '1';
--        elsif(data_inp(n_bits-1) = '0') then
--            pan_temp <= data_inp(7 downto 0);
--            pt_state <= '0';
--        else
--          NULL;
--            --tilt_motor <= (others => '0');
--            --pan_motor <= (others => '0');
--        end if;
    
  -- end process;
--tilt_motor <= tilt_temp;
--pan_motor <= pan_temp;

