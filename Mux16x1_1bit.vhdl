library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux16x1_1bit is
	port (
		I: in std_logic_vector(15 downto 0);
		S: in std_logic_vector(3 downto 0);
		O: out std_logic
	);
end entity;

architecture main of Mux16x1_1bit is
begin
	O <= (not(S(3)) and not(S(2)) and not(S(1)) and not(S(0)) and I(0) ) or
         (not(S(3)) and not(S(2)) and not(S(1)) and     S(0)  and I(1) ) or
         (not(S(3)) and not(S(2)) and     S(1)  and not(S(0)) and I(2) ) or
         (not(S(3)) and not(S(2)) and     S(1)  and     S(0)  and I(3) ) or
         (not(S(3)) and     S(2)  and not(S(1)) and not(S(0)) and I(4) ) or
         (not(S(3)) and     S(2)  and not(S(1)) and     S(0)  and I(5) ) or
         (not(S(3)) and     S(2)  and     S(1)  and not(S(0)) and I(6) ) or
         (not(S(3)) and     S(2)  and     S(1)  and     S(0)  and I(7) ) or
         (    S(3)  and not(S(2)) and not(S(1)) and not(S(0)) and I(8) ) or
         (    S(3)  and not(S(2)) and not(S(1)) and     S(0)  and I(9) ) or
         (    S(3)  and not(S(2)) and     S(1)  and not(S(0)) and I(10)) or
         (    S(3)  and not(S(2)) and     S(1)  and     S(0)  and I(11)) or
         (    S(3)  and     S(2)  and not(S(1)) and not(S(0)) and I(12)) or
         (    S(3)  and     S(2)  and not(S(1)) and     S(0)  and I(13)) or
         (    S(3)  and     S(2)  and     S(1)  and not(S(0)) and I(14)) or
         (    S(3)  and     S(2)  and     S(1)  and     S(0)  and I(15));
end architecture; 