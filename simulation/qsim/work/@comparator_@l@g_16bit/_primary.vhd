library verilog;
use verilog.vl_types.all;
entity Comparator_LG_16bit is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        L               : out    vl_logic;
        G               : out    vl_logic
    );
end Comparator_LG_16bit;
