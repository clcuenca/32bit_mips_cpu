library verilog;
use verilog.vl_types.all;
entity full_adder_1 is
    port(
        data_in_0       : in     vl_logic;
        data_in_1       : in     vl_logic;
        carry_in        : in     vl_logic;
        carry_out       : out    vl_logic;
        data_out        : out    vl_logic
    );
end full_adder_1;
