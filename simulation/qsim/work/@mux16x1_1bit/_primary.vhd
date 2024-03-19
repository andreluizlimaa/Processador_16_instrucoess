library verilog;
use verilog.vl_types.all;
entity Mux16x1_1bit is
    port(
        I               : in     vl_logic_vector(15 downto 0);
        s3              : in     vl_logic;
        s2              : in     vl_logic;
        s1              : in     vl_logic;
        s0              : in     vl_logic;
        O               : out    vl_logic
    );
end Mux16x1_1bit;
