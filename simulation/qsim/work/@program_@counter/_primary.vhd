library verilog;
use verilog.vl_types.all;
entity Program_Counter is
    port(
        D               : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        ld              : in     vl_logic;
        clr             : in     vl_logic;
        up              : in     vl_logic;
        Q               : out    vl_logic_vector(15 downto 0)
    );
end Program_Counter;
