library ieee;
use ieee.std_logic_1164.all;

entity Reg_File is
    port (
        -- inputs
        W_data: in std_logic_vector(15 downto 0);
        W_addr, Rp_addr, Rq_addr: in std_logic_vector(3 downto 0);
        W_wr, Rp_rd, Rq_rd, clk: in std_logic;

        -- outputs
        Rp_data, Rq_data: out std_logic_vector(15 downto 0)
    );
end entity;

architecture main of Reg_File is
    type stdlv_vector is array (natural range <>) of std_logic_vector(15 downto 0);

    signal loads:    std_logic_vector(15 downto 0);
    signal Qs:       stdlv_vector(15 downto 0);
    signal Rp_gates: std_logic_vector(15 downto 0);
    signal Rq_gates: std_logic_vector(15 downto 0);

    component Decoder_4x16 is
        port (
            e: in std_logic;
            I: in std_logic_vector(3 downto 0);
            D: out std_logic_vector(15 downto 0)
        );
    end component;

    component Reg_ld is
        port (
            D: in std_logic_vector(15 downto 0); 
            clk, ld: in std_logic;
            Q: out std_logic_vector(15 downto 0)
	    );
    end component;

    component Tri_State_Gate_16bit is
        port (
            G: in std_logic;
            I: in std_logic_vector(15 downto 0);
		    O: out std_logic_vector(15 downto 0)
	    );
    end component;
begin
    wr_dec: Decoder_4x16 port map (
        e => W_wr, I => W_addr, D => loads
    );

    inst: for k in 0 to 15 generate
        R: Reg_ld port map (
            D => W_data, clk => clk, ld => loads(k), Q => Qs(k)
        );

        GP: Tri_State_Gate_16bit port map (
            I => Qs(k), G => Rp_gates(k), O => Rp_data
        );

        GQ: Tri_State_Gate_16bit port map (
            I => Qs(k), G => Rq_gates(k), O => Rq_data
        );
    end generate inst;

    Rp_rd_dec: Decoder_4x16 port map (
        e => Rp_rd, I => Rp_addr, D => Rp_gates
    );

    Rq_rd_dec: Decoder_4x16 port map (
        e => Rq_rd, I => Rq_addr, D => Rq_gates
    );
end architecture main;