library verilog;
use verilog.vl_types.all;
entity Reg_File is
    port(
        W_data          : in     vl_logic_vector(15 downto 0);
        W_addr          : in     vl_logic_vector(3 downto 0);
        Rp_addr         : in     vl_logic_vector(3 downto 0);
        Rq_addr         : in     vl_logic_vector(3 downto 0);
        W_wr            : in     vl_logic;
        Rp_rd           : in     vl_logic;
        Rq_rd           : in     vl_logic;
        clk             : in     vl_logic;
        Rp_data         : out    vl_logic_vector(15 downto 0);
        Rq_data         : out    vl_logic_vector(15 downto 0)
    );
end Reg_File;
