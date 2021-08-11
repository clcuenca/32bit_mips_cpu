library verilog;
use verilog.vl_types.all;
entity d_ff is
    port(
        data_in         : in     vl_logic;
        enable          : in     vl_logic;
        clock           : in     vl_logic;
        clear           : in     vl_logic;
        data_out        : out    vl_logic;
        \data_out_\     : out    vl_logic
    );
end d_ff;
