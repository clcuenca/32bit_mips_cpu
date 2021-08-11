/// Two-to-One Multiplexer
/// Author: Carlos L. Cuenca
/// Created: 07/29/2021

module mux_two_one(select, data_in_0, data_in_1, data_out);

	/// -----------
	/// Input Ports
	
	input select    ; // Data selection
	input data_in_0 ; // Data 1
	input data_in_1 ; // Data 2
	
	/// ------------
	/// Output Ports
	
	output data_out; // Output
	
	/// -----------------
	/// Assign Statements
	
	assign data_out = (~select & data_in_0) | (select & data_in_1); // One assignment for two inputs

endmodule