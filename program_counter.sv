/// Program Counter Implementation
/// @author: Carlos L. Cuenca

module program_counter(address_in, address_out, clock);

	/// -----------
	/// Input Ports
	
	input  [31:0] address_in	; // The address to overwrite
	input 		      clock 		   ; // The Clock Signal
	
	/// ------
	/// Output
	
	output[31:0] address_out; // The address to output
	
	/// -------------------
	/// Internal Components
	
	reg[31:0] memory;
	reg[7:0]  divider;
	
	/// -----------------
	/// Assign Statements
	
	assign address_out = memory;
	
	always@(posedge clock) begin
	  
	  if(divider == 8'b00000000) begin
	    
	   if(^address_in === 1'bx) begin
	    
	     memory <= 32'h00000000;
	    
	   end else begin
	    
	     memory <= address_in;
	    
	   end
	    
	    divider++;
	    
	  end else if(divider == 8'b00000100) begin
	    
	    divider <= 8'b00000000;
	    
	  end else begin
	    
	    divider++;
	    
	  end
	  
	end
	
	/// --------------
	/// Initial Blocks
	
	initial begin
    divider     = 8'b00000000;
		memory      = 32'h00000000;
		
	
	end

endmodule