/// D flip-flop
/// Author: Carlos L. Cuenca

module d_ff (data_in, enable, clock, clear, data_out, data_out_);

	/// -----------
	/// Input Ports
	
	input data_in  ; // The data input ports
	input enable   ; // The enable signal that allows any changes to be made
	input clock    ; // The clock updates our data
	input clear    ; // Sets our data to 0
	
	/// ------------
	/// Output Ports
	
	output reg data_out  ; // Parallel output
	output     data_out_ ; // Q inverted
	
	/// -----------------
	/// Assign statements
	
	assign data_out_ = ~data_out;
	
	// At each rising edge of the clock
	always @ (posedge clock) begin
	
		// Data in condition
		if(enable == 1'b1) begin
			
			data_out <= data_in & ~clear;
			
		// Memory Condition
		end else begin
			
			data_out <= data_out & ~clear;
			
		end
		
	end
		
endmodule