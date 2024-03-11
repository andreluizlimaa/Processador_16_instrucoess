library ieee;
use ieee.std_logic_1164.all;

ENTITY Decode IS
PORT(
    A1,A0,E: IN std_logic;

Y0,Y1,Y2,Y3 : OUT std_logic

);

END;
ARCHITECTURE comb OF Decode IS
BEGIN
Y0 <= E AND NOT(A1) AND NOT(A0);
Y1 <= E AND NOT(A1) AND A0;
Y2 <= E AND A1 AND NOT(A0);
Y3 <= E AND A1 AND A0;
END;