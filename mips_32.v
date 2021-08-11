// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Tue Aug 10 17:21:20 2021"

module mips_32(clock);

input wire	clock;

wire	[31:0] new_address					;
wire	[31:0] current_address				;
wire	[31:0] instruction  				;
wire	[31:0] pc_4  						;
wire	[31:0] write_data 					;
wire [4:0] read_register_1;
wire [4:0] read_register_2;
wire	[4:0]  write_register 				;
wire	[31:0] read_data_2_register_file	;
wire	[31:0] read_data_1_register_file	;
wire	[31:0] instruction_immediate   		;
wire	[31:0] alu_source 					;
wire	[31:0] alu_result 					;
wire	[31:0] data_memory_out				;
wire	[31:0] branch_immediate 			;
wire	[31:0] calculated_branch_address 	;
wire	[31:0] branch_address_ 				;
wire	[31:0] shifted_jump_immediate   	;
wire	[31:0] calculated_jump_address 		;
wire	reg_write 							;
wire	mem_read 							;
wire	mem_write							;
wire	mem_to_reg 							;
wire	branch_and 							;
wire	jump 								;
wire	branch 								;
wire	alu_src 							;
wire	reg_dst 							;
wire	zero_signal 						;
wire	[2:0]  alu_op 						;
wire	[3:0]  alu_control_ 				;
wire	[31:0] hard_4 						;
assign read_register_1 = instruction[25:21];
assign read_register_2 = instruction[20:16];
full_adder_32	b2v_inst(
	.data_in_0(hard_4),
	.data_in_1(current_address),
	.data_out(pc_4));

shifter_2_bit	b2v_inst1(
	.data_in(instruction),
	.data_out(shifted_jump_immediate   ));

program_counter	b2v_inst2(
	.clock(clock),
	.address_in(new_address),
	.address_out(current_address));

instruction_memory_4kb	b2v_inst35(
	.clock(clock),
	.address(current_address),
	.instruction(instruction));

jump_joiner	b2v_inst36(
	.address(shifted_jump_immediate   ),
	.pc(pc_4),
	.output_address(calculated_jump_address));

register_file	b2v_inst37(
	.clock(clock)	,
	.RegWrite(reg_write)	,
	.read_register_1(read_register_1)	,
	.read_register_2(read_register_2)	,
	.write_data(write_data 				)	,
	.write_register(write_register 				),
	.read_data_1(read_data_1_register_file),
	.read_data_2(read_data_2_register_file));	

mux_5_two_one	b2v_ins(
	.select(reg_dst),
	.data_in_0(instruction[20:16])	,
	.data_in_1(instruction[15:11])	,
	.data_out(write_register));

sign_extension_unit_16_32	b2v_inst41(
	.data_in(instruction[15:0]),
	.data_out(instruction_immediate));


mux_32_two_one	b2v_inst42(
	.select(alu_src),
	.data_in_0(read_data_2_register_file),
	.data_in_1(instruction_immediate),
	.data_out(alu_source));


alu_32	b2v_inst43(
	.alu_control(alu_control_),
	.data_in_0(read_data_1_register_file),
	.data_in_1(alu_source),
	.zero(zero_signal),
	.result(alu_result 				));


data_memory_4kb	b2v_inst45(
	.clock(clock),
	.memread(mem_read),
	.memwrite(mem_write),
	.address(alu_result 				),
	.write_data(read_data_2_register_file),
	.read_data(data_memory_out));


mux_32_two_one	b2v_inst46(
	.select(mem_to_reg),
	.data_in_0(alu_result 				),
	.data_in_1(data_memory_out),
	.data_out(write_data 				));


full_adder_32	b2v_inst47(
	.data_in_0(pc_4),
	.data_in_1(branch_immediate),
	.data_out(calculated_branch_address));


shifter_2_bit	b2v_inst48(
	.data_in(instruction_immediate),
	.data_out(branch_immediate));


mux_32_two_one	b2v_inst49(
	.select(branch_and),
	.data_in_0(pc_4),
	.data_in_1(calculated_branch_address),
	.data_out(branch_address_));

mux_32_two_one	b2v_inst50(
	.select(jump),
	.data_in_0(branch_address_),
	.data_in_1(calculated_jump_address),
	.data_out(new_address));

assign	branch_and = branch & zero_signal;

alu_control	b2v_inst52(
	.ALUOp(alu_op),
	.instruction(instruction[5:0]),
	.control(alu_control_));

control	b2v_inst53(
	.opcode(instruction[31:26]),
	.RegDST(reg_dst),
	.Jump(jump),
	.Branch(branch),
	.MemRead(mem_read),
	.MemToReg(mem_to_reg),
	.MemWrite(mem_write),
	.ALUSrc(alu_src),
	.RegWrite(reg_write),
	.ALUOp(alu_op));

assign hard_4 = 32'h00000004;

endmodule


