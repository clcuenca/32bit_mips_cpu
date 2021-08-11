/// 32-bit full adder
/// @author: Carlos L. Cuenca

module full_adder_32(data_in_0, data_in_1, data_out);

	/// -----------
	/// Input Ports
	
	input[31:0] data_in_0; // First operand
	input[31:0] data_in_1; // Second Operand
	
	/// ------------
	/// Output Ports
	
	output[31:0] data_out;
	
	/// --------------
	/// Internal Buses
	
	wire[31:0] carry_out_internal;
	
	/// ----------------
	/// Internal Modules
	
	full_adder_1 adders[31:0](.data_in_0(data_in_0[31:0]),
									  .data_in_1(data_in_1[31:0]),
									  .carry_in({carry_out_internal[30:0], 1'b0}),
									  .data_out(data_out[31:0]),
									  .carry_out(carry_out_internal));
	

endmodule