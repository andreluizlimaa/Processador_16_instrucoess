library ieee;
use ieee.std_logic_1164.all;

entity Tri_State_Gate_16bit is
	port (
		G: in std_logic;
		I: in std_logic_vector(15 downto 0);
		O: out std_logic_vector(15 downto 0)
	);
end entity;

architecture main of Tri_State_Gate_16bit is
begin
	O <= I when G = '1' else (others => 'Z');
end architecture;