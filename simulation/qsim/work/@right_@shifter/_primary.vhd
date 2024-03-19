library verilog;
use verilog.vl_types.all;
entity Right_Shifter is
    port(
        I               : in     vl_logic_vector(15 downto 0);
        S               : in     vl_logic_vector(3 downto 0);
        O               : out    vl_logic_vector(15 downto 0)
    );
end Right_Shifter;
