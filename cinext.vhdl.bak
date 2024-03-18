library ieee;
use ieee.std_logic_1164.all;

ENTITY cinext IS
PORT(
    s2, s1, s0: IN std_logic;
    cin: OUT std_logic
);
END ENTITY;

ARCHITECTURE comb OF cinext IS
BEGIN
    cin <= not(s2) and s1 and not(s0); 
END ARCHITECTURE;
