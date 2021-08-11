library verilog;
use verilog.vl_types.all;
entity mux_32_1 is
    port(
        \select\        : in     vl_logic_vector(4 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic
    );
end mux_32_1;
