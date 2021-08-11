library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        clock           : in     vl_logic;
        read_register_1 : in     vl_logic_vector(4 downto 0);
        read_register_2 : in     vl_logic_vector(4 downto 0);
        write_register  : in     vl_logic_vector(4 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        read_data_1     : out    vl_logic_vector(31 downto 0);
        read_data_2     : out    vl_logic_vector(31 downto 0);
        RegWrite        : in     vl_logic
    );
end register_file;
