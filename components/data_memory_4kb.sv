/// 4kb data Memory
/// @author: Carlos L. Cuenca

module data_memory_4kb(clock, memread, memwrite, address, write_data, read_data);

	/// -----------
	/// Input Ports
	
	input 		clock			 ; // Clock Signal
	input			memwrite 	 ; // Data write signal
	input       memread		 ; // The data Read signal
	input[31:0] address		 ; // The address of the desired data
	input[31:0] write_data 	 ; // The data to write
	
	/// ------------
	/// Output Ports
	
	output logic [31:0] read_data ; // The output Data
	
	/// -------------------
	/// Internal Components
	
	// 32-bit x 1024
	reg [31:0] memory [511:0]; // Sequential memory elements
	reg [7:0]  divider       ;
	
	/// ------------------
	/// Clock Driven Logic
	
	always @ (posedge clock) begin
	  
	  if(divider == 8'b00000011) begin

		    // We are writing an instruction
		    if(memwrite == 1'b1) begin
		
			    // Set the given instruction to the appropriate
			    // word in memory
			    memory[address] <= write_data;
		
		    // Otherwise, it's read condition
		    end else if(memread == 1'b1) begin
		
			    // Assign the output to the word
			    // in the specified address
			    read_data = memory[address]; 
		
		    end

	      divider++;
	    
	  end else if(divider == 8'b00000100) begin
	    
	    divider <= 8'b00000000;
	    
	  end else begin
	    
	    divider++;
	    
	  end
		
	end
	
	initial begin
	
    divider = 8'b00000000;
		memory['h00000000] = 32'd16	 ; // 16 Elements
		memory['h00000004] = 32'd500   ; 
		memory['h00000008] = -32'd2    ; 
		memory['h0000000c] = -32'd555  ; 
		memory['h00000010] = 32'd9000  ; 
		memory['h00000014] = 32'd1023  ; 
		memory['h00000018] = 32'd420   ; 
		memory['h0000001c] = -32'd420  ; 
		memory['h00000020] = 32'd17789 ; 
		memory['h00000024] = 32'd0     ; 
		memory['h00000028] = 32'd55    ; 
		memory['h0000002c] = 32'd17    ; 
		memory['h00000030] = 32'd90    ; 
		memory['h00000034] = 32'd256   ; 
		memory['h00000038] = 32'd128   ; 
		memory['h0000003c] = 32'd45    ; 
		memory['h00000040] = 32'd1     ; 
	
	end
	
endmodule