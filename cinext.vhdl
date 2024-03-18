library ieee;
use ieee.std_logic_1164.all;

entity cinext is
    port (
        s2, s1, s0: in std_logic;
        cin: out std_logic
    );
end entity;

architecture main of cinext is
begin
    cin <= not(s2) and s1 and not(s0); 
end architecture;
