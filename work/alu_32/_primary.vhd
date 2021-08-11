library verilog;
use verilog.vl_types.all;
entity alu_32 is
    port(
        data_in_0       : in     vl_logic_vector(31 downto 0);
        data_in_1       : in     vl_logic_vector(31 downto 0);
        alu_control     : in     vl_logic_vector(3 downto 0);
        zero            : out    vl_logic;
        result          : out    vl_logic_vector(31 downto 0)
    );
end alu_32;
