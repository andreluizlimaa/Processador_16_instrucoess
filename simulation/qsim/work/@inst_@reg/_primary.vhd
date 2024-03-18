library verilog;
use verilog.vl_types.all;
entity Inst_Reg is
    port(
        D               : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        ld              : in     vl_logic;
        Q               : out    vl_logic_vector(15 downto 0)
    );
end Inst_Reg;
