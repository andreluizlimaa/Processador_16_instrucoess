library ieee;
use ieee.std_logic_1164.all;

entity Regis_ld is
  port (
    -- inputs
    D: in std_logic_vector(15 downto 0); 
    clk, ld: in std_logic;

      -- outputs
    Q: out std_logic_vector(15 downto 0)
  );
end;

architecture behav of Regis_ld is

    signal q_i0: std_logic_vector(15 downto 0);
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

  component Mux2x1 is
    port (
        I0,I1: in std_logic_vector(15 downto 0);
        sel: in std_logic;
        O: out std_logic_vector(15 downto 0)
      );
  end component;

begin

    --Atribuição
    Q <= q_i0;

  -- Instanciar flip-flops usando um loop
    u0: Regis port map (
      D => o_d,clk => clk, Q => q_i0
    );
    u1: Mux2x1 port map (
        I0 => q_i0 ,I1 => D, sel => ld, O => o_d
      );

end architecture;