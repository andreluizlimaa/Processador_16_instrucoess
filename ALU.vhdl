library ieee;
use ieee.std_logic_1164.all;

entity ALU is
  port (
    A,B : IN std_logic_vector(15 downto 0);
    S0, S1, S2: IN std_logic;
    R: OUT std_logic_vector(15 downto 0);
    Ovf: OUT std_logic

  ) ;
end;

architecture comb of ALU is

    signal cin_ci: std_logic;
    signal ia_A: std_logic_vector(15 downto 0);
    signal ib_B: std_logic_vector(15 downto 0);
    signal S_RLMO: std_logic_vector(15 downto 0);
    signal OR_i1: std_logic_vector(15 downto 0);
    signal OL_i0: std_logic_vector(15 downto 0);
    signal OM_i1M: std_logic_vector(15 downto 0);


    component Mux2x1 is
        port (
            I0,I1: in std_logic_vector(15 downto 0);
            sel: in std_logic;
            O: out std_logic_vector(15 downto 0)
        );
    end component;

    component cinext is
    port (
        s2, s1, s0: IN std_logic;
        cin: OUT std_logic
    );
    end component;

    component abext is
        port (
            s2, s1, s0, a, b: IN std_logic;
            ia, ib: OUT std_logic
        );
    end component;

    component right_shifter is
    port (
        I: IN std_logic_vector(15 downto 0);
        O: OUT std_logic_vector(15 downto 0)
    );
    end component;
    
    component left_shifter is
    port (
        I: IN std_logic_vector(15 downto 0);
        O: OUT std_logic_vector(15 downto 0)
    );
    end component;

    component Somador_16bit is
        port (
            a,b: in std_logic_vector(15 downto 0);
            cin: in std_logic;
        
            co: out std_logic;
            s: out std_logic_vector(15 downto 0)
        );
    end component;

begin
    -- instanciar Somador
    g_generate_for: for k in 0 to 15 generate

    u3: abext port map (
        a => A(k), b => B(k), s0 => S0, s1 => S1, s2 => S2, ia => ia_A(k), ib => ib_B(k)
    );
  end generate g_generate_for;

    u0: cinext port map (
        s0 => S0, s1 => S1, s2 => S2, cin => cin_ci
    );

    u1: Somador_16bit port map (
        A => ia_A, B => ib_B, cin => cin_ci, s => S_RLMO
    );

    u2: right_shifter port map (
        I => S_RLMO, O => OR_i1
    );

    u3: left_shifter port map (
        I => S_RLMO, O => OL_i0
    );

    MuxShift: Mux2x1 port map (
        I0 => OL_i0, I1 => OR_i1, sel => S0, O => OM_i1M
    );

    MuxR: Mux2x1 port map (
        I0 => S_RLMO, I1 => OM_i1M, sel => S1 and S2, O => R
    );

    Ovf <= not(s2) and ((not(s1) and s0 and ((not(A(15)) and not(B(15)) and S_RLMO(15)) or (A(15) and B(15) and not(S_RLMO(15))))) or (s1 and not(s0) and ((not(A(15)) and B(15) and S_RLMO(15)) or (A(15) and not(B(15)) and not(S_RLMO(15))))));

end architecture ; -- arch