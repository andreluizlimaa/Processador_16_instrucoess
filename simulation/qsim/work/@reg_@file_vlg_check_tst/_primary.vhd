library verilog;
use verilog.vl_types.all;
entity Reg_File_vlg_check_tst is
    port(
        Rp_data         : in     vl_logic_vector(15 downto 0);
        Rq_data         : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Reg_File_vlg_check_tst;
