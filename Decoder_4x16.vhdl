library ieee;
use ieee.std_logic_1164.all;

entity Decoder_4x16 is
    port (
        e: in std_logic;
        I: in std_logic_vector(3 downto 0);
        D: out std_logic_vector(15 downto 0)
    );
end entity;

architecture main of Decoder_4x16 is
begin
    D(0) <= e and not(I(3)) and not(I(2)) and not(I(1)) and not(I(0));
    D(1) <= e and not(I(3)) and not(I(2)) and not(I(1)) and I(0);
    D(2) <= e and not(I(3)) and not(I(2)) and I(1) and not(I(0));
    D(3) <= e and not(I(3)) and not(I(2)) and I(1) and I(0);
    D(4) <= e and not(I(3)) and I(2) and not(I(1)) and not(I(0));
    D(5) <= e and not(I(3)) and I(2) and not(I(1)) and I(0);
    D(6) <= e and not(I(3)) and I(2) and I(1) and not(I(0));
    D(7) <= e and not(I(3)) and I(2) and I(1) and I(0);
    D(8) <= e and I(3) and not(I(2)) and not(I(1)) and not(I(0));
    D(9) <= e and I(3) and not(I(2)) and not(I(1)) and I(0);
    D(10) <= e and I(3) and not(I(2)) and I(1) and not(I(0));
    D(11) <= e and I(3) and not(I(2)) and I(1) and I(0);
    D(12) <= e and I(3) and I(2) and not(I(1)) and not(I(0));
    D(13) <= e and I(3) and I(2) and not(I(1)) and I(0);
    D(14) <= e and I(3) and I(2) and I(1) and not(I(0));
    D(15) <= e and I(3) and I(2) and I(1) and I(0);
end architecture;
