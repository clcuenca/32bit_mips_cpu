library verilog;
use verilog.vl_types.all;
entity full_adder_32 is
    port(
        data_in_0       : in     vl_logic_vector(31 downto 0);
        data_in_1       : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end full_adder_32;
