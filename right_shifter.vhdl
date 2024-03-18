library ieee;
use ieee.std_logic_1164.all;

ENTITY right_shifter IS
PORT(
    I: IN std_logic_vector(15 downto 0);
    O: OUT std_logic_vector(15 downto 0)
);
END ENTITY;

ARCHITECTURE comb OF right_shifter IS
begin
    -- Instanciar flip-flops usando um loop
    g_generate_for: for k in 0 to 14 generate
        O(k) <= I(k+1);
    end generate g_generate_for;

    --Atribuição
    O(15) <= '0';
    
end architecture;