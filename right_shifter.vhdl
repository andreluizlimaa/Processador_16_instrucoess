library ieee;
use ieee.std_logic_1164.all;

entity Right_Shifter is
    port (
        I: in std_logic_vector(15 downto 0);
        O: out std_logic_vector(15 downto 0)
    );
end entity;

architecture main of Right_Shifter is
begin
    connect: for k in 0 to 14 generate
        O(k) <= I(k + 1);
    end generate connect;

    O(15) <= '0';
end architecture;