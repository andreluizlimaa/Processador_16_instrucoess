library verilog;
use verilog.vl_types.all;
entity Right_Shifter_vlg_check_tst is
    port(
        O               : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Right_Shifter_vlg_check_tst;
