library ieee;
use ieee.std_logic_1164.all;

entity Comparator_LG_1bit is
	port (
		A, B, ie, il, ig: in std_logic;
		e, l, g: out std_logic
	);
end entity;

architecture main of Comparator_LG_1bit is
begin
	e <= not(il) and not(ig) and (A xnor B);
	l <= not(ig) and (not(ie) or (not(A) and B));
	g <= not(il) and (not(ie) or (A and not(B)));
end architecture;