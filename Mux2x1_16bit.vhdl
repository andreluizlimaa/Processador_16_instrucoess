LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Mux2x1_16bit is
	port (
		I0,I1: in std_logic_vector(15 downto 0);
		s: in std_logic;
		O: out std_logic_vector(15 downto 0)
	);
end entity;

architecture main of Mux2x1_16bit is
begin
	-- Instanciar muxes
	inst: for i in 0 to 15 generate
		O(i) <= (I1(i) and s) or (I0(i) and not(s));
	end generate inst;
end architecture; 