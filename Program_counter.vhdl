library ieee;
use ieee.std_logic_1164.all;

entity Program_counter is
  port (
    -- inputs
    D: in std_logic_vector(15 downto 0); 
    clk, ld, clr, up: in std_logic;

      -- outputs
    Q: out std_logic_vector(15 downto 0)
  ) ;
end entity ;

architecture comb of Program_counter is

        signal s_i1: std_logic_vector(15 downto 0);
        signal q_b_i0: std_logic_vector(15 downto 0);
        signal a_i3: std_logic_vector(15 downto 0) := (others => '0'); -- Constante composta por 0s
        signal o_d: std_logic_vector(15 downto 0);



    component Regis is
      port (
      -- inputs
      D: in std_logic_vector(15 downto 0); 
      clk: in std_logic;
      
      -- outputs
      Q: out std_logic_vector(15 downto 0)
        );
    end component;
    
    component Mux4x1 is
      port (
          I0, I1, I2, I3: in std_logic_vector(15 downto 0);
          sel0, sel1: in std_logic;
          O: out std_logic_vector(15 downto 0)
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

    --atribuição
    Q <= q_b_i0;

  -- Instanciar flip-flops usando um loop
    u0: Regis port map (
      D => o_d, clk => clk, Q => q_b_i0
    );
    u1: Mux4x1 port map (
        I3 => a_i3, I2 => D, I1 => s_i1, I0 => q_b_i0, O => o_d, sel0 => clr or up, sel1 => ld or clr
      );
    u2: Somador_16bit port map (
        A => a_i3, B => q_b_i0, s => s_i1, cin => '1'
    );   



end architecture ; -- arch