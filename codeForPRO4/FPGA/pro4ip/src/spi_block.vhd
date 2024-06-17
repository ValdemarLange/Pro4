library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity state_test is
    generic(data_width : integer := 12);
  port (
    rst : in std_logic;
    --spi interface
    sclk : in  std_logic;
    mosi : in  std_logic;
    miso : out std_logic;
    ss : in  std_logic;
    
    --state_out : out STD_LOGIC;
    
    
    --transmit register
    data_to_send : in std_logic_vector(data_width-1 downto 0);
    
    --receive register
    data_received: out std_logic_vector(data_width-1 downto 0);
    motor_select : out STD_LOGIC;
    direction_select : out STD_LOGIC
  );
end entity state_test;

architecture Behavioral of state_test is

    type STATE_TYPE is (s_idle, s_receive);
    signal bit_cnt : UNSIGNED(3 downto 0) := (others => '0');
    signal current_state : STATE_TYPE := s_idle;
    signal next_state : STATE_TYPE := s_idle;

   
    signal receive_reg : std_logic_vector(data_width-1 downto 0) := (others => '0');  -- Shift register for received
    signal transmit_reg : std_logic_vector(data_width-1 downto 0) := (others => '0');  -- Shift register for transmitted data
    
    
begin


------------------------------------------------------------------------------
    current_state_logic :   process(sclk)
    ------------------------------------------------------------------------------
    -- Current state logic process. Here goes state transitions and state 
    -- transition assignments. Clock and reset sensitive.
    ------------------------------------------------------------------------------
    begin
    ------------------------------------------------------------------------------
        
        if(falling_edge(sclk)) then
            current_state   <=  next_state;         -- State transition (only valid from process exit)
            case current_state is                   -- State transition assignments
                when s_idle =>
                    bit_cnt <= (others => '0'); --Reset variables eller
                    --receive_reg <= (others => '0'); --Clear shift reg
                    transmit_reg <= data_to_send;
                when s_receive =>
                    receive_reg <= receive_reg(data_width-2 downto 0) & mosi;                    
                    transmit_reg <= transmit_reg(data_width-2 downto 0) & '0';
                    bit_cnt <= bit_cnt + 1;
                    
                when others =>
                    null;
            end case;
        end if;
        



       
    ------------------------------------------------------------------------------
    end process current_state_logic;
    ------------------------------------------------------------------------------



    ------------------------------------------------------------------------------
    next_state_logic    :   process(current_state, bit_cnt, ss)  -- Add input signals to sensitivity list
    ------------------------------------------------------------------------------
    -- Next state logic process. Here goes state transition conditions. 
    -- Sensitive to state change and input signals.
    ------------------------------------------------------------------------------
    begin
    ------------------------------------------------------------------------------
        case current_state is                       -- Remember all state transition 
        
            when s_receive =>
                --Check bitcount
                if (bit_cnt = 11) then
                    next_state  <=  s_idle;              -- Use conditional logic based on input 
                end if;    

            when s_idle =>
                --Gå videre til receive ved ss=0
                --starter transmissionen
                    if(falling_edge(ss)) then 
                        next_state <= s_receive;
                    end if;
                
            when others =>
                null;
        end case;
    ------------------------------------------------------------------------------
    end process next_state_logic;
    ------------------------------------------------------------------------------



    ------------------------------------------------------------------------------
    output_logic        :   process(current_state, sclk, ss) --transmit_reg, receive_reg)
    ------------------------------------------------------------------------------
    -- Output logic process. Here goes output assignments. 
    -- Sensitive to state change only.
    ------------------------------------------------------------------------------
    begin
    ------------------------------------------------------------------------------
        case current_state is                       -- Remember all states
        
            when s_receive =>
                if(rising_edge (sclk)) then                 
                    miso <= transmit_reg(data_width-1);
                end if;
                --state_out <= '1';
                
            when s_idle =>
            	data_received <= receive_reg;
            	motor_select <= receive_reg(data_width-1);
            	direction_select <= receive_reg(data_width-2);
            	--state_out <= '0';
            	
                if(ss='1') then
                   miso <= '0';
                end if;
            	
            when others =>
                null;
        end case;
    ------------------------------------------------------------------------------
    end process output_logic;
    ------------------------------------------------------------------------------

end Behavioral;
