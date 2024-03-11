library ieee;
use ieee.std_logic_1164.all;

entity Regis is
  port (
    -- inputs
    D: in std_logic_vector(15 downto 0); 
    clk: in std_logic;

      -- outputs
  Q: out std_logic_vector(15 downto 0)
  );
end;

architecture behav of Regis is
  component FlipflopD is
    port (
    D, clk: in std_logic;
    Q: out std_logic 
      );
  end component;

begin
  -- Instanciar flip-flops usando um loop
  g_generate_for: for i in 0 to 15 generate
    u: FlipflopD port map (
      D => D(i),clk => clk, Q => Q(i)
    );
  end generate g_generate_for;
end architecture;