library verilog;
use verilog.vl_types.all;
entity program_counter is
    port(
        address_in      : in     vl_logic_vector(31 downto 0);
        address_out     : out    vl_logic_vector(31 downto 0);
        clock           : in     vl_logic
    );
end program_counter;
