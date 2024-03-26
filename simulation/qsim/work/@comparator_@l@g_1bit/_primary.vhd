library verilog;
use verilog.vl_types.all;
entity Comparator_LG_1bit is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        ie              : in     vl_logic;
        il              : in     vl_logic;
        ig              : in     vl_logic;
        e               : out    vl_logic;
        l               : out    vl_logic;
        g               : out    vl_logic
    );
end Comparator_LG_1bit;
