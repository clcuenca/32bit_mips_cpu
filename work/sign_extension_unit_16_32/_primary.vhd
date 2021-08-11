library verilog;
use verilog.vl_types.all;
entity sign_extension_unit_16_32 is
    port(
        data_in         : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end sign_extension_unit_16_32;
