/// 1-bit Full-Adder
/// Author: Carlos L. Cuenca
/// Created: 07/30/2021

module full_adder_1(data_in_0, data_in_1, carry_in, carry_out, data_out);

	/// -----------
	/// Input Ports
	
	input data_in_0 ; // First operand
	input data_in_1 ; // Second operand
	input carry_in  ; // Carry In
	
	/// ------------
	/// Output Ports
	
	output carry_out ; // Carry Out
	output data_out  ; // Operation Result
	
	/// -----------------
	/// Assign Statements
	
	assign data_out  = ((data_in_0 ^ data_in_1) ^ carry_in);
	assign carry_out = (data_in_0 & data_in_1) | ((data_in_0 ^ data_in_1) & carry_in);

endmodule