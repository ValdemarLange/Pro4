----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 09:19:49 AM
-- Design Name: 
-- Module Name: encoder_M1_pulse - Behavioral
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

entity encoder_tilt_pulse is
    generic(
        n_bits : POSITIVE := 8
    );
    Port ( B_in : in STD_LOGIC;
           A_in : in STD_LOGIC;
           rst : in STD_LOGIC;
--           led_1    :   out std_logic;
--           led_2    :   out std_logic;
           count : out STD_LOGIC_VECTOR(n_bits-1 downto 0)
           
           );
end encoder_tilt_pulse;

architecture Behavioral of encoder_tilt_pulse is
    signal count_temp : unsigned(n_bits-1 downto 0) := (others => '0');
    signal first_run : STD_LOGIC := '1';
begin
    process(A_in, B_in, rst)
    begin
        if(rst = '1') then
            count_temp <= (others => '0');
            first_run <= '1';
        elsif(falling_edge(A_in)) then
            if (B_in = '1') then -- falling edge
                count_temp <= count_temp + 1;
            elsif (B_in = '0') then -- falling edge
                count_temp <= count_temp - 1;
            end if;
        end if;
        
        if (first_run = '1' AND rst = '0') then
            count_temp <= "10000000000";
            first_run <= '0';
        end if;
        
    end process;
    
    count <= STD_LOGIC_VECTOR(count_temp);
    
end Behavioral;

--entity encoder_tilt_pulse is
--    generic(
--        n_bits : POSITIVE := 12
--    );
--    Port ( 
--           clk : in STD_LOGIC;
--           B_in : in STD_LOGIC;
--           A_in : in STD_LOGIC;
--           rst : in STD_LOGIC;
--           --led_1    :   out std_logic;
--           --led_2    :   out std_logic;
--           count : out STD_LOGIC_VECTOR(n_bits-1 downto 0)
           
--           );
--end encoder_tilt_pulse;

--architecture Behavioral of encoder_tilt_pulse is
--    signal count_temp : unsigned(n_bits-1 downto 0) := (others => '0');
--    signal A_last : STD_LOGIC := '0';
--    signal B_last : STD_LOGIC := '0';
--begin
--    process(clk, rst)
--    begin
--        if(rst = '1') then
--            count_temp <= "10000000000";
--            A_last <= '0';
--            B_last <= '0';
            
--        elsif (rising_edge(clk)) then
--            if (A_in = '1' AND A_last = '0') then --rising edge A
--                if (B_in = '0') then
--                        count_temp <= count_temp + 1;  
----                        led_1 <= '1';
--                    else
--                        count_temp <= count_temp - 1;  
--  --                      led_1 <= '0';
--                 end if;
--            end if;
--            if (A_in = '0' AND A_last = '1') then --falling edge A
--                if B_in = '1' then
--                        count_temp <= count_temp + 1;  
--                        --led_1 <= '1';
--                    else
--                        count_temp <= count_temp - 1;  
--                        --led_1 <= '0';
--                 end if;
--            end if;
--            if (B_in = '1' AND B_last = '0') then --rising edge B
--                if A_in = '1' then
--                        count_temp <= count_temp + 1;  
--    --                    led_2 <= '1';
--                    else
--                        count_temp <= count_temp - 1;  
--      --                  led_2 <= '0';
--                 end if;
--            end if;
--            if (B_in = '0' AND B_last = '1') then --falling edge B
--                if A_in = '0' then
--                        count_temp <= count_temp + 1;  
--                        --led_2 <= '1';
--                    else
--                        count_temp <= count_temp - 1;  
--                        --led_2 <= '0';
--                 end if;
--            end if; 
--            A_last <= A_in;
--            B_last <= B_in;
--        end if;
 

--    end process;
    
--    count <= STD_LOGIC_VECTOR(count_temp);
    
--end Behavioral;