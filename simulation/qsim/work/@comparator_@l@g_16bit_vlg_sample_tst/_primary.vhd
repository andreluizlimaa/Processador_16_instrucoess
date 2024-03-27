library verilog;
use verilog.vl_types.all;
entity Comparator_LG_16bit_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end Comparator_LG_16bit_vlg_sample_tst;
