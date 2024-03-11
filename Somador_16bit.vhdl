-- Somador 16 bits
library ieee;
use ieee.std_logic_1164.all;

entity Somador_16bit is
  port (
    a,b: in std_logic_vector(15 downto 0);
    cin: in std_logic;

    co: out std_logic;
    s: out std_logic_vector(15 downto 0)
  ) ;
end entity ;

architecture comb of Somador_16bit is
    component Somador_1bit is
        port (
        a,b,cin: in std_logic;

        co,s: out std_logic
          );
      end component;


 signal carrys: std_logic_vector(16 downto 0);
begin
    carrys(0) <= cin;
    -- instanciar Somador
    g_generate_for: for i in 0 to 15 generate
    u: Somador_1bit port map (
      a => a(i), b => b(i), cin => carrys(i), co => carrys(i+1), s => s(i)
    );
  end generate g_generate_for;
  co <= carrys(16);
end architecture ; -- arch