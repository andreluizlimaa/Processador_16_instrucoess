-- Somador
library ieee;
use ieee.std_logic_1164.all;

entity Somador_1bit is
  port (

    a,b,cin: in std_logic;

    co,s: out std_logic
  ) ;
end entity ;

architecture comb of Somador_1bit is

begin
    co <= (a and b) or (cin and (a or b));
    s <= a xor b xor cin;
end architecture ; -- arch