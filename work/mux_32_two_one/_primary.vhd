library verilog;
use verilog.vl_types.all;
entity mux_32_two_one is
    port(
        data_in_0       : in     vl_logic_vector(31 downto 0);
        data_in_1       : in     vl_logic_vector(31 downto 0);
        \select\        : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end mux_32_two_one;
