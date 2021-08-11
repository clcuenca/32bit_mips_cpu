library verilog;
use verilog.vl_types.all;
entity mips_32_vlg_check_tst is
    port(
        memory_out_0    : in     vl_logic;
        memory_out_1    : in     vl_logic;
        memory_out_2    : in     vl_logic;
        memory_out_3    : in     vl_logic;
        memory_out_4    : in     vl_logic;
        memory_out_5    : in     vl_logic;
        opcode0         : in     vl_logic;
        opcode1         : in     vl_logic;
        opcode2         : in     vl_logic;
        opcode3         : in     vl_logic;
        opcode4         : in     vl_logic;
        opcode5         : in     vl_logic;
        read_0          : in     vl_logic;
        read_1          : in     vl_logic;
        read_2          : in     vl_logic;
        read_3          : in     vl_logic;
        read_4          : in     vl_logic;
        read_5          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end mips_32_vlg_check_tst;
