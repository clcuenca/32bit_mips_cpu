library verilog;
use verilog.vl_types.all;
entity mux_two_one is
    port(
        \select\        : in     vl_logic;
        data_in_0       : in     vl_logic;
        data_in_1       : in     vl_logic;
        data_out        : out    vl_logic
    );
end mux_two_one;
