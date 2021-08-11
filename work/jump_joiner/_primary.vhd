library verilog;
use verilog.vl_types.all;
entity jump_joiner is
    port(
        pc              : in     vl_logic_vector(31 downto 0);
        address         : in     vl_logic_vector(31 downto 0);
        output_address  : out    vl_logic_vector(31 downto 0)
    );
end jump_joiner;
