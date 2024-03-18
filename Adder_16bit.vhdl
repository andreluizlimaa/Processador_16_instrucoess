-- Somador 16 bits
library ieee;
use ieee.std_logic_1164.all;

entity Adder_16bit is
	port (
		A, B: in std_logic_vector(15 downto 0);
		Ci: in std_logic;

		Co: out std_logic;
		S: out std_logic_vector(15 downto 0)
	);
end entity;

architecture main of Adder_16bit is
	signal carries: std_logic_vector(16 downto 0);

    component Adder_1bit is
        port (
			A, B, Ci: in std_logic;

			Co, S: out std_logic
        );
    end component;
begin
    carries(0) <= Ci;
    -- instanciar Adders
    inst: for i in 0 to 15 generate
		u: Adder_1bit port map (
			A => A(i), B => B(i), Ci => carries(i), Co => carries(i + 1), S => S(i)
		);
	end generate inst;
  	Co <= carries(16);
end architecture; -- arch