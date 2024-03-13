LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Mux4x1 is
  port (
    I0, I1, I2, I3: in std_logic_vector(15 downto 0);
    sel0, sel1: in std_logic;
    O: out std_logic_vector(15 downto 0)
  );
end entity Mux4x1;

architecture behav of Mux4x1 is
  signal m13: std_logic_vector(15 downto 0);
  signal m23: std_logic_vector(15 downto 0);

  component Mux2x1 is
    port (
      I0, I1: in std_logic_vector(15 downto 0);
      sel: in std_logic;
      O: out std_logic_vector(15 downto 0)
    );
  end component;

begin
  m1: Mux2x1 port map(
    I0 => I0, I1 => I1, sel => sel0, O => m13
  );

  m2: Mux2x1 port map(
    I0 => I2, I1 => I3, sel => sel0, O => m23
  );

  m3: Mux2x1 port map(
    I0 => m13, I1 => m23, sel => sel1, O => O
  );

end architecture behav;