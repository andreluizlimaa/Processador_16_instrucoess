library verilog;
use verilog.vl_types.all;
entity Mux2x1_16bit is
    port(
        I0              : in     vl_logic_vector(15 downto 0);
        I1              : in     vl_logic_vector(15 downto 0);
        s               : in     vl_logic;
        O               : out    vl_logic_vector(15 downto 0)
    );
end Mux2x1_16bit;
