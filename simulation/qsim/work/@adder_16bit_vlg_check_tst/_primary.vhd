library verilog;
use verilog.vl_types.all;
entity Adder_16bit_vlg_check_tst is
    port(
        Co              : in     vl_logic;
        S               : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Adder_16bit_vlg_check_tst;
