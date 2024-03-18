library ieee;
use ieee.std_logic_1164.all;

entity Reg_ld is
	port (
		-- inputs
		D: in std_logic_vector(15 downto 0); 
		clk, ld: in std_logic;

		-- outputs
		Q: out std_logic_vector(15 downto 0)
	);
end entity;

architecture main of Reg_ld is
    signal q_i0: std_logic_vector(15 downto 0);
    signal o_d: std_logic_vector(15 downto 0);

	component Reg is
		port (
			-- inputs
			D: in std_logic_vector(15 downto 0); 
			clk: in std_logic;

			-- outputs
			Q: out std_logic_vector(15 downto 0)
		);
	end component;

	component Mux2x1_16bit is
		port (
			I0, I1: in std_logic_vector(15 downto 0);
			s: in std_logic;
			O: out std_logic_vector(15 downto 0)
		);
	end component;
begin
    Q <= q_i0;

    u0: Reg port map (
    	D => o_d, clk => clk, Q => q_i0
    );
    u1: Mux2x1_16bit port map (
		I0 => q_i0, I1 => D, s => ld, O => o_d
    );
end architecture;