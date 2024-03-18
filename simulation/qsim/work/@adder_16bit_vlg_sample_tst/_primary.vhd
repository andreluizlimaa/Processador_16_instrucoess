library verilog;
use verilog.vl_types.all;
entity Adder_16bit_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        Ci              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Adder_16bit_vlg_sample_tst;
