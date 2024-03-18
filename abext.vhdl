library ieee;
use ieee.std_logic_1164.all;

ENTITY abext IS
PORT(
    s2, s1, s0, a, b: IN std_logic;
    ia, ib: OUT std_logic
);
END ENTITY;

ARCHITECTURE comb OF abext IS
BEGIN
    ia <= (a and ((not(s2) and (not(s1) or b)) or not(s0) or (s1 and s2))) or (s2 and not(s1) and s0 and not(a));
    ib <= (not(s2) and not(s1) and s0 and b) or (not(s2) and s1 and not(s0) and not(b)) or (s2 and not(s1) and not(s0) and not(a) and b);
END ARCHITECTURE;
