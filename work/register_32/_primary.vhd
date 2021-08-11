library verilog;
use verilog.vl_types.all;
entity register_32 is
    port(
        parallel_in     : in     vl_logic_vector(31 downto 0);
        enable          : in     vl_logic;
        clock           : in     vl_logic;
        clear           : in     vl_logic;
        parallel_out    : out    vl_logic_vector(31 downto 0);
        \parallel_out_\ : out    vl_logic_vector(31 downto 0)
    );
end register_32;
