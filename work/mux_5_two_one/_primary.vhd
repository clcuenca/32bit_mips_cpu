library verilog;
use verilog.vl_types.all;
entity mux_5_two_one is
    port(
        data_in_0       : in     vl_logic_vector(4 downto 0);
        data_in_1       : in     vl_logic_vector(4 downto 0);
        data_out        : out    vl_logic_vector(4 downto 0);
        \select\        : in     vl_logic
    );
end mux_5_two_one;
