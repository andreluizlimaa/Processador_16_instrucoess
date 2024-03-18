library verilog;
use verilog.vl_types.all;
entity Inst_Reg_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic_vector(15 downto 0);
        ld              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Inst_Reg_vlg_sample_tst;
