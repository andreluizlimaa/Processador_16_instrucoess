LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Mux2x1 is
  port (
    I0,I1: in std_logic_vector(15 downto 0);
    sel: in std_logic;
    O: out std_logic_vector(15 downto 0)
  ) ;
end entity;

architecture behav of Mux2x1 is

    begin
      -- Instanciar mux
      g_generate_for: for i in 0 to 15 generate
          O(i) <= (I1(i) AND sel) Or (I0(i) And Not(sel));
      end generate g_generate_for;
end architecture ; 