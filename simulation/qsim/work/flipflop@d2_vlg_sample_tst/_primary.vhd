library verilog;
use verilog.vl_types.all;
entity flipflopD2_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end flipflopD2_vlg_sample_tst;