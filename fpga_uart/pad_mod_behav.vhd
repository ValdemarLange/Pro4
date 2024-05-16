-- VHDL Entity pad_mod
--
-- Created:
--          by - Emad Samuel 
--          at - 10:10:01 26/09/2019
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY pad_mod IS
   PORT( 
      key_pressed : IN     std_logic_vector (4 DOWNTO 0);
      rows        : IN     std_logic_vector (3 DOWNTO 0);
      cols        : OUT    std_logic_vector (3 DOWNTO 0)
   );

-- Declarations

END pad_mod ;

-- hds interface_end

-- hds interface_end


-- hds interface_end
ARCHITECTURE behav OF pad_mod IS
BEGIN
process(rows,key_pressed)
  variable cols_var: std_logic_vector(3 downto 0);
begin
cols_var:= "0000";
if (key_pressed(4)='1') then
cols_var(conv_integer(unsigned(key_pressed(1 downto 0)))):=rows(conv_integer(unsigned(key_pressed(3 downto 2)))) ;
else 
cols_var:= "0000";
end if;
cols<= cols_var;
end process;

END behav;

