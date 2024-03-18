library ieee;
use ieee.std_logic_1164.all;

entity Program_Counter is
	port (
		-- inputs
		D: in std_logic_vector(15 downto 0); 
		clk, ld, clr, up: in std_logic;

		-- outputs
		Q: out std_logic_vector(15 downto 0)
	);
end entity ;

architecture main of Program_Counter is
	signal s_i1: std_logic_vector(15 downto 0);
	signal q_b_i0: std_logic_vector(15 downto 0);
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
    
    component Mux4x1_16bit is
		port (
			I0, I1, I2, I3: in std_logic_vector(15 downto 0);
			s0, s1: in std_logic;
			O: out std_logic_vector(15 downto 0)
		);
    end component;

    component Adder_16bit is
		port (
			A, B: in std_logic_vector(15 downto 0);
			Ci: in std_logic;
			
			Co: out std_logic;
			S: out std_logic_vector(15 downto 0)
		);
    end component;
begin
    Q <= q_b_i0;

    u0: Reg port map (
      	D => o_d, clk => clk, Q => q_b_i0
    );
    u1: Mux4x1_16bit port map (
        I3 => (others => '0'), I2 => D, I1 => s_i1, I0 => q_b_i0, O => o_d, s0 => clr or up, s1 => ld or clr
    );
    u2: Adder_16bit port map (
        A => (others => '0'), B => q_b_i0, S => s_i1, Ci => '1'
    );   
end architecture;