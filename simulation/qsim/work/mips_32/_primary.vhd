library verilog;
use verilog.vl_types.all;
entity mips_32 is
    port(
        opcode5         : out    vl_logic;
        clock           : in     vl_logic;
        opcode4         : out    vl_logic;
        opcode3         : out    vl_logic;
        opcode2         : out    vl_logic;
        opcode1         : out    vl_logic;
        opcode0         : out    vl_logic;
        read_0          : out    vl_logic;
        read_1          : out    vl_logic;
        read_2          : out    vl_logic;
        read_3          : out    vl_logic;
        read_4          : out    vl_logic;
        read_5          : out    vl_logic;
        memory_out_0    : out    vl_logic;
        memory_out_1    : out    vl_logic;
        memory_out_2    : out    vl_logic;
        memory_out_3    : out    vl_logic;
        memory_out_4    : out    vl_logic;
        memory_out_5    : out    vl_logic
    );
end mips_32;
