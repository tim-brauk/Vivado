----------------------------------------------------------------------------------
-- Module Name: blink_led_top - Structural
-- Description: Laesst eine LED auf dem Arty A7 mit ca. 1 Hz blinken.
--              Der 100-MHz-Takt treibt einen 27-Bit-Binaerzaehler (bincntr);
--              das MSB hat eine Periode von 2^27 / 100 MHz = 1,34 s (~0,75 Hz).
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blink_led_top is
    Port ( clk : in STD_LOGIC;     -- 100 MHz Quarzoszillator (Pin E3)
           led : out STD_LOGIC);   -- LD4 (Pin H5)
end blink_led_top;

architecture Structural of blink_led_top is
    constant CNTR_WIDTH : positive := 27;
    signal cntr_s : std_logic_vector(CNTR_WIDTH-1 downto 0);
begin

    cntr_inst : entity work.bincntr
        generic map ( WIDTH => CNTR_WIDTH )
        port map ( clk_in      => clk,
                   counter_out => cntr_s );

    led <= cntr_s(CNTR_WIDTH-1);

end Structural;
