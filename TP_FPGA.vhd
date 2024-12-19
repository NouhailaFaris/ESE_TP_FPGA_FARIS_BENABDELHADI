library ieee;
use ieee.std_logic_1164.all;
entity TP_FPGA is
port (
i_clk : in std_logic;
i_rst_n : in std_logic;
o_led : out std_logic
);
end entity TP_FPGA;
architecture rtl of TP_FPGA is
signal r_led_enable : std_logic := '0';
signal r_led : std_logic := '0';
begin
process(i_clk, i_rst_n)
variable counter : natural range 0 to 5000000 := 0;
begin
if (i_rst_n = '0') then
counter := 0;
r_led_enable <= '0';
elsif (rising_edge(i_clk)) then
if (counter = 5000000) then
counter := 0;
r_led_enable <= '1';
else
counter := counter + 1;
r_led_enable <= '0';
end if;
if (r_led_enable = '1') then
r_led <= not r_led;
end if;
end if;
end process;
o_led <= r_led;
end architecture rtl;