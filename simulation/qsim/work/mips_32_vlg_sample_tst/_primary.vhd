library verilog;
use verilog.vl_types.all;
entity mips_32_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mips_32_vlg_sample_tst;
