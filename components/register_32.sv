/// 32-bit PIPO Register
/// Author: Carlos L. Cuenca
/// Created: 07/29/2021

/// ------------
/// Module Start

module register_32(parallel_in, enable, clock, clear, parallel_out, parallel_out_);
	
	/// -----------
	/// Input Ports
	
	input [31:0] parallel_in ; // Data input
	input        enable		 ; // Enable Signal
	input        clock		 ; // Clock Signal
	input        clear		 ; // Clear Signal
	
	/// ------------
	/// Output Ports
	
	output [31: 0] parallel_out ; // Parallel Output
	output [31: 0] parallel_out_; // Inverted Parallel Out

	/// ----------
	/// Components
	
	d_ff flip_flops [31:0](.data_in(parallel_in),
								  .enable(enable),
								  .clock(clock),
								  .clear(clear),
								  .data_out(parallel_out),
								  .data_out_(parallel_out_));

endmodule