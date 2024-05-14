library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d_latch is
    generic(n_bits : POSITIVE := 8
            );
    Port ( en : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR(n_bits-1 downto 0);
           Q : out STD_LOGIC_VECTOR(n_bits-1 downto 0));
           --Q_bar : out STD_LOGIC_VECTOR(n_bits-1 downto 0));
end d_latch;

architecture RTL of d_latch is
begin 
    process (D, en)
        begin
            if rising_edge(en) then
                Q <= D;
                --Q_bar <= not D;
        end if;
    end process;
end RTL;