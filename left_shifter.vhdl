library ieee;
use ieee.std_logic_1164.all;

entity Left_Shifter IS
    port (
        I: IN std_logic_vector(15 downto 0);
        O: OUT std_logic_vector(15 downto 0)
    );
end entity;

architecture main of Left_Shifter is
begin
    connect: for k in 0 to 14 generate
        O(k+1) <= I(k);
    end generate connect;

    O(0) <= '0';
end architecture;