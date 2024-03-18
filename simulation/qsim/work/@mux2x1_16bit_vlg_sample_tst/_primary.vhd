library verilog;
use verilog.vl_types.all;
entity Mux2x1_16bit_vlg_sample_tst is
    port(
        I0              : in     vl_logic_vector(15 downto 0);
        I1              : in     vl_logic_vector(15 downto 0);
        s               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Mux2x1_16bit_vlg_sample_tst;
