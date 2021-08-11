library verilog;
use verilog.vl_types.all;
entity instruction_memory_4kb is
    port(
        clock           : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0)
    );
end instruction_memory_4kb;
