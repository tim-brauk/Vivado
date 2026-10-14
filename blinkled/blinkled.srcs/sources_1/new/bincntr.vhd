----------------------------------------------------------------------------------
-- Module Name: bincntr - Behavioral
-- Description: Generischer Binaerzaehler (aus Projekt "binarycounter" uebernommen).
--              Breite fuer BlinkLed auf 27 Bit angepasst.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bincntr is
    Generic ( WIDTH : positive := 27 );
    Port ( clk_in      : in  STD_LOGIC;
           counter_out : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end bincntr;

architecture Behavioral of bincntr is
    signal cntr_s : unsigned(WIDTH-1 downto 0) := (others => '0');
begin

    process (clk_in)
    begin
        if rising_edge(clk_in) then
            cntr_s <= cntr_s + 1;
        end if;
    end process;

    counter_out <= std_logic_vector(cntr_s);

end Behavioral;
