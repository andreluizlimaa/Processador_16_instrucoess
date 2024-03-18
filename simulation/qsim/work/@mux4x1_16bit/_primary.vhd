library verilog;
use verilog.vl_types.all;
entity Mux4x1_16bit is
    port(
        I0              : in     vl_logic_vector(15 downto 0);
        I1              : in     vl_logic_vector(15 downto 0);
        I2              : in     vl_logic_vector(15 downto 0);
        I3              : in     vl_logic_vector(15 downto 0);
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        O               : out    vl_logic_vector(15 downto 0)
    );
end Mux4x1_16bit;
