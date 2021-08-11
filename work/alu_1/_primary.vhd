library verilog;
use verilog.vl_types.all;
entity alu_1 is
    port(
        data_in_0       : in     vl_logic;
        data_in_1       : in     vl_logic;
        alu_control     : in     vl_logic_vector(3 downto 0);
        zero            : out    vl_logic;
        result          : out    vl_logic;
        carry_in        : in     vl_logic;
        carry_out       : out    vl_logic
    );
end alu_1;
