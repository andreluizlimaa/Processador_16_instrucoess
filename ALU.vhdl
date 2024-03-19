library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port (
        A, B : in std_logic_vector(15 downto 0);
        s0, s1, s2: in std_logic;
        R: out std_logic_vector(15 downto 0);
        Ovf: out std_logic
    );
end entity;

architecture main of ALU is
    signal ci_ci: std_logic;
    signal ia_A: std_logic_vector(15 downto 0);
    signal ib_B: std_logic_vector(15 downto 0);
    signal S_RLMO: std_logic_vector(15 downto 0);
    signal B_S: std_logic_vector(3 downto 0);
    signal OR_i1: std_logic_vector(15 downto 0);
    signal OL_i0: std_logic_vector(15 downto 0);
    signal OM_i1M: std_logic_vector(15 downto 0);

    component Mux2x1_16bit is
        port (
            I0, I1: in std_logic_vector(15 downto 0);
            s: in std_logic;
            O: out std_logic_vector(15 downto 0)
        );
    end component;

    component cinext is
        port (
            s2, s1, s0: in std_logic;
            cin: out std_logic
        );
    end component;

    component abext is
        port (
            s2, s1, s0, a, b: in std_logic;
            ia, ib: out std_logic
        );
    end component;

    component Right_Shifter is
        port (
            I: in std_logic_vector(15 downto 0);
            S: in std_logic_vector(3 downto 0);
            O: out std_logic_vector(15 downto 0)
        );
    end component;
    
    component Left_Shifter is
        port (
            I: in std_logic_vector(15 downto 0);
            S: in std_logic_vector(3 downto 0);
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
    -- instanciar abexts
    inst: for k in 0 to 15 generate
        ab: abext port map (
            a => A(k), b => B(k), s0 => s0, s1 => s1, s2 => s2, ia => ia_A(k), ib => ib_B(k)
        );
    end generate inst;

    c: cinext port map (
        s0 => s0, s1 => s1, s2 => s2, cin => ci_ci
    );

    add: Adder_16bit port map (
        A => ia_A, B => ib_B, Ci => ci_ci, s => S_RLMO
    );

    B_S <= B(3 downto 0);

    rs: Right_Shifter port map (
        I => S_RLMO, O => OR_i1, S => B_S
    );

    ls: Left_Shifter port map (
        I => S_RLMO, O => OL_i0, S => B_S
    );

    MSh: Mux2x1_16bit port map (
        I0 => OL_i0, I1 => OR_i1, s => s0, O => OM_i1M
    );

    MR: Mux2x1_16bit port map (
        I0 => S_RLMO, I1 => OM_i1M, s => s1 and s2, O => R
    );

    Ovf <= not(s2) and ((not(s1) and s0 and ((not(A(15)) and not(B(15)) and S_RLMO(15)) or (A(15) and B(15) and not(S_RLMO(15))))) or (s1 and not(s0) and ((not(A(15)) and B(15) and S_RLMO(15)) or (A(15) and not(B(15)) and not(S_RLMO(15))))));
end architecture;