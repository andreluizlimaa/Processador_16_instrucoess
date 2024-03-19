library verilog;
use verilog.vl_types.all;
entity Mux16x1_1bit_vlg_sample_tst is
    port(
        I               : in     vl_logic_vector(15 downto 0);
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        s2              : in     vl_logic;
        s3              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Mux16x1_1bit_vlg_sample_tst;
