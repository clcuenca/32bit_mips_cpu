/// 5-Bit two to one Multiplexer
/// Author: Carlos L. Cuenca

module mux_5_two_one(data_in_0, data_in_1, data_out, select);

	/// -----------
	/// Input Ports
	
	input[4:0] data_in_0; // Data input 0
	input[4:0] data_in_1; // Data input 1
	input		  select   ; // Selection Signal
	
	/// ------------
	/// Output Ports
	
	output[4:0] data_out;
	
	/// ---------------------
	/// Assignment Statements
	
	assign data_out[0] = (data_in_0[0] & ~select) | (data_in_1[0] & select);
	assign data_out[1] = (data_in_0[1] & ~select) | (data_in_1[1] & select);
	assign data_out[2] = (data_in_0[2] & ~select) | (data_in_1[2] & select);
	assign data_out[3] = (data_in_0[3] & ~select) | (data_in_1[3] & select);
	assign data_out[4] = (data_in_0[4] & ~select) | (data_in_1[4] & select);

endmodule