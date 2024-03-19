library ieee;
use ieee.std_logic_1164.all;

entity Right_Shifter is
    port (
        I: in std_logic_vector(15 downto 0);
        S: in std_logic_vector(3 downto 0);
        O: out std_logic_vector(15 downto 0)
    );
end entity;

architecture main of Right_Shifter is
    component Mux16x1_1bit is
        port (
            I: in std_logic_vector(15 downto 0);
            S: in std_logic_vector(3 downto 0);
            O: out std_logic
        );
    end component;
begin
    m: Mux16x1_1bit port map (
        I => I, S => S, O => O(0)
    );

    inst: for k in 1 to 15 generate
        m: Mux16x1_1bit port map (
            I(15 - k downto 0) => I(15 downto k), I(15 downto 16 - k) => (others => '0'), S => S, O => O(k)
        );
    end generate inst;
end architecture;