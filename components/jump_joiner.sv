module jump_joiner(pc, address, output_address);

	/// -----------
	/// Input Ports
	
	input[31:0] pc 	  ; // Program Counter input
	input[31:0] address ; // 26-bit Address
	
	/// ------------
	/// Output Ports
	
	output[31:0] output_address; // The Resultant address
	
	/// -----------------
	/// Assign Statements
	
	assign output_address = {pc[31:28], address[27:0]};

endmodule