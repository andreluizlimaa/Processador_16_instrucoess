library verilog;
use verilog.vl_types.all;
entity Inst_Reg_vlg_check_tst is
    port(
        Q               : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Inst_Reg_vlg_check_tst;
