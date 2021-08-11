library verilog;
use verilog.vl_types.all;
entity decoder_5_to_32 is
    port(
        selection       : in     vl_logic_vector(4 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end decoder_5_to_32;
