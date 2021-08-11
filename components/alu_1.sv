/// 1-bit ALU
/// Author: Carlos L. Cuenca
/// Created: 07/30/2021

/// ------------------
/// Include Statements

module alu_1(data_in_0, data_in_1, alu_control, zero, result, carry_in, carry_out);
	
	/// -----------
	/// Input Ports
	
	input data_in_0           ; // First operand
	input data_in_1           ; // Second operand
	input carry_in            ; // Carry In
	input [3:0] alu_control   ; // Operation selection
	
	/// ------------
	/// Output Ports
	
	output zero      ; // Zero Signal
	output result    ; // Operation result
	output carry_out ; // Carry Out
	
	/// --------------
	/// Internal Buses
	
	wire add_result;
	
	/// -----------------
	/// Assign Statements
	
	// Neither of the inputs can be 1
	assign zero   = data_in_0 | data_in_1;
	
	// Set less than not included (Sold separately).
	assign result = ((~alu_control[3] & ~alu_control[2] & ~alu_control[1] & ~alu_control[0]) &  (data_in_0 & data_in_1)) |
						 ((~alu_control[3] & ~alu_control[2] & ~alu_control[1] &  alu_control[0]) &  (data_in_0 | data_in_1)) |
						 ((~alu_control[3] & ~alu_control[2] &  alu_control[1] & ~alu_control[0]) &  (add_result)) 			  |
						 ((~alu_control[3] &  alu_control[2] &  alu_control[1] & ~alu_control[0]) &  (add_result)) 			  |
						 ((~alu_control[3] & ~alu_control[2] &  alu_control[1] &  alu_control[0]) &  (add_result)) 			  |
						 (( alu_control[3] &  alu_control[2] & ~alu_control[1] & ~alu_control[0]) & ~(data_in_0 | data_in_1));
	// Sum
	full_adder_1 adder(.data_in_0(data_in_0),
							 .data_in_1(data_in_1),
							 .data_out(add_result),
							 .carry_in(carry_in),
							 .carry_out(carry_out));
							 
	

endmodule