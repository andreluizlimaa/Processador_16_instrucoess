library ieee;
use ieee.std_logic_1164.all;

entity FlipflopD is
	port (
		D, clk: in std_logic;
		Q: out std_logic := '0'
	);
end entity;

architecture main of FlipflopD is
	signal Q_D: std_logic;

	component LatchD is
		port (
			D, clk: in std_logic;
			Q: out std_logic := '0'
		);
	end component;
begin
	
	L1: LatchD port map (
		D => D, clk => not(clk), Q => Q_D
	);

	L2: LatchD port map (
		D => Q_D, clk => clk, Q => Q
	);
end architecture;
