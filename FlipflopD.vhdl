library ieee;
use ieee.std_logic_1164.all;

entity FlipflopD is
	port (
		D, clk: in std_logic;
		Q: out std_logic := '0'
	);
end entity;

architecture main of FlipflopD is
begin
	process (D,clk)
	begin
		if(clk' event and clk = '1') then
			Q <= D;
		end if;
	end process;
end architecture;
