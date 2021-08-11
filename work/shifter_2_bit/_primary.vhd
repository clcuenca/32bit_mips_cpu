library verilog;
use verilog.vl_types.all;
entity shifter_2_bit is
    port(
        data_in         : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end shifter_2_bit;
