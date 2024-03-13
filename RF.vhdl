library ieee;
use ieee.std_logic_1164.all;

entity RF is
    port (
        -- inputs
        w_data: in std_logic_vector(15 downto 0);  
        w_addr: in std_logic_vector(3 downto 0); -- Escrita
        w_wr: in std_logic;                      -- Escrita
        rp_addr: in std_logic_vector(3 downto 0); -- LeituraP
        rp_rd: in std_logic;                      -- LeituraP
        rq_addr: in std_logic_vector(3 downto 0); -- LeituraQ
        rq_rd: in std_logic;                      -- LeituraQ
        clk: in bit
    
          -- outputs
        rp_data: out std_logic_vector(15 downto 0);
        rq_data: out std_logic_vector(15 downto 0); 
      );
    end;

architecture behav of RF is
    component Regis is
        port (
          -- inputs
          d: in std_logic_vector(15 downto 0); 
          clk: in bit
      
            -- outputs
        q: out std_logic_vector(15 downto 0);
        );
      end component;


begin



end architecture ; -- arch
