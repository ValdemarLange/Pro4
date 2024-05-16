-- hds header_start
--
-- VHDL Entity uart_trials.uart_loop_mod.symbol
--
-- Created:
--          by - Emad Samuel (esme@mmmi.sdu.dk)
--          at - 07:58:23 11/06/2019
--
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY uart_loop_mod IS
   PORT( 
      clkfast    : IN     std_logic;
      data_out   : IN     std_logic_vector (7 DOWNTO 0);
      intr       : IN     std_logic;
      rst        : IN     std_logic;
      xmitmt     : IN     std_logic;
      data_in    : OUT    std_logic_vector (7 DOWNTO 0);
      shift_load : OUT    std_logic
   );

-- Declarations

END uart_loop_mod ;

-- hds interface_end
--
-- VHDL Architecture uart_trials.uart_loop_mod.fsm
--
-- Created:
--          by - Emad Samuel (esme@mmmi.sdu.dk)
--          at - 07:58:23 11/06/2019
--
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE fsm OF uart_loop_mod IS

   -- Architecture Declarations
   signal uart_data:std_logic_vector(7 downto 0);
   --signal cnt : unsigned (3 downto 0);

   TYPE STATE_TYPE IS (
      s0,
      s1,
      s2
   );

   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state" ;


   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE ;
   SIGNAL next_state : STATE_TYPE ;

BEGIN

   ----------------------------------------------------------------------------
   clocked : PROCESS(
      clkfast,
      rst
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (rst = '1') THEN
         current_state <= s0;
         -- Reset Values
         uart_data <= (others=>'0');
      ELSIF (clkfast'EVENT AND clkfast = '1') THEN
         current_state <= next_state;
         -- Default Assignment To Internals

         -- Combined Actions for internal signals only
         CASE current_state IS
         WHEN s0 =>
            uart_data <= data_out;
         WHEN OTHERS =>
            NULL;
         END CASE;

      END IF;

   END PROCESS clocked;

   ----------------------------------------------------------------------------
   nextstate : PROCESS (
      current_state,
      intr,
      xmitmt
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE current_state IS
      WHEN s0 =>
         IF (intr = '1') THEN
            next_state <= s1;
         ELSE
            next_state <= s0;
         END IF;
      WHEN s1 =>
            next_state <= s2;
      WHEN s2 =>
         IF (xmitmt = '1') THEN
            next_state <= s0;
         ELSE
            next_state <= s1;
         END IF;
      WHEN OTHERS =>
         next_state <= s0;
      END CASE;

   END PROCESS nextstate;

   ----------------------------------------------------------------------------
   output : PROCESS (
      current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      -- Default Assignment
      -- Default Assignment To Internals

      -- Combined Actions
      CASE current_state IS
      WHEN s0 =>
         shift_load<= '0';
      WHEN s1 =>
         shift_load<= '1';
      WHEN OTHERS =>
         NULL;
      END CASE;
   
   END PROCESS output;

   -- Concurrent Statements
data_in <= uart_data;

END fsm;
