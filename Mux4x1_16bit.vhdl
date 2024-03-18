LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Mux4x1_16bit is
	port (
		I0, I1, I2, I3: in std_logic_vector(15 downto 0);
		s0, s1: in std_logic;
		O: out std_logic_vector(15 downto 0)
	);
end entity;

architecture main of Mux4x1_16bit is
	signal m13: std_logic_vector(15 downto 0);
	signal m23: std_logic_vector(15 downto 0);

	component Mux2x1_16bit is
		port (
			I0, I1: in std_logic_vector(15 downto 0);
			s: in std_logic;
			O: out std_logic_vector(15 downto 0)
		);
	end component;
begin
	m1: Mux2x1_16bit port map(
		I0 => I0, I1 => I1, s => s0, O => m13
	);

	m2: Mux2x1_16bit port map(
		I0 => I2, I1 => I3, s => s0, O => m23
	);

	m3: Mux2x1_16bit port map(
		I0 => m13, I1 => m23, s => s1, O => O
	);

end architecture;
