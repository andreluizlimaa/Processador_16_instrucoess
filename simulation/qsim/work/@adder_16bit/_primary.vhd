library verilog;
use verilog.vl_types.all;
entity Adder_16bit is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        Ci              : in     vl_logic;
        Co              : out    vl_logic;
        S               : out    vl_logic_vector(15 downto 0)
    );
end Adder_16bit;
