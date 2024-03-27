library ieee;
use ieee.std_logic_1164.all;

entity Comparator_LG_16bit is
	port (
		A, B: in std_logic_vector(15 downto 0);
		L, G: out std_logic
	);
end entity;

architecture main of Comparator_LG_16bit is
	signal eq_vector: std_logic_vector(15 downto 0);
	signal lt_vector: std_logic_vector(15 downto 0);
	signal gt_vector: std_logic_vector(15 downto 0);

	component Comparator_LG_1bit is
		port (
			A, B, ie, il, ig: in std_logic;
			e, l, g: out std_logic
		);
	end component;
begin
	inst: for k in 0 to 14 generate
		comp: Comparator_LG_1bit port map (
			A => A(14 - k), B => B(14 - k), ie => eq_vector(k), il => lt_vector(k), ig => gt_vector(k),
			e => eq_vector(k + 1), l => lt_vector(k + 1), g => gt_vector(k + 1)
		);
	end generate inst;

	eq_vector(0) <= '1';
	lt_vector(0) <= '0';
	gt_vector(0) <= '0';

	L <= (A(15) and not(B(15))) or (A(15) and lt_vector(15)) or (B(15) and lt_vector(15));
	G <= (not(A(15)) and B(15)) or (not(A(15)) and gt_vector(15)) or (B(15) and gt_vector(15));
end architecture;