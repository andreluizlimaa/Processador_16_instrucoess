library verilog;
use verilog.vl_types.all;
entity flipflopD2 is
    port(
        D               : in     vl_logic;
        clk             : in     vl_logic;
        Q               : out    vl_logic
    );
end flipflopD2;
