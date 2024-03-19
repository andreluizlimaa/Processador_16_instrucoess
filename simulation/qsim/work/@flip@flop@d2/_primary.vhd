library verilog;
use verilog.vl_types.all;
entity FlipFlopD2 is
    port(
        D               : in     vl_logic;
        clk             : in     vl_logic;
        Q               : out    vl_logic
    );
end FlipFlopD2;
