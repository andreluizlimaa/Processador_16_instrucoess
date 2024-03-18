-- Somador
library ieee;
use ieee.std_logic_1164.all;

entity Adder_1bit is
	port (
		A, B, Ci: in std_logic;

		Co, S: out std_logic
	);
end entity;

architecture main of Adder_1bit is
begin
    Co <= (A and B) or (Ci and (A or B));
    S <= A xor B xor Ci;
end architecture;