# 32-Bit MIPS CPU

This was a final project for one of my labs.

## Organization

Quartus organizes things in its' own way. Most of the SystemVerilog files reside in the "Components" directory.

## Necessary Software

Intel/Altera Quartus 13.1 is necessary to simulate the processor, specifically ModelSim. ModelSim comes installed with Quartus.

## Known Issues

When compiling/running within quartus, make sure to rename mips_32.sv to something else or else it will compain that there's a redifinition
of the top level module.
When simulating within ModelSim make sure that mips_32.sv is in the root directory, compile, and then simulate by right-clicking and selecting 'Simulate'.
ModelSim will go into simulation mode, and then to start and view all signals in the simulation, right-click mips-32 and select 'add wave'. 
Make sure that the clock signal is set to "clock" by right-clicking the clock signal within the waveform screen and selecting "clock".

The 32-bit alu uses a comparator instead of the subtraction result.

The zero register is not hardwired (it can be modified)

