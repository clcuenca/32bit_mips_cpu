/// Author: Carlos L. Cuenca
/// Created: 07/25/2021
/// Implementation of a 32x32 register file.

/// ------------------
/// Include Statements

`include "components/decoder_5_to_32.sv"
`include "components/mux_32_1.sv"

module register_file(clock, read_register_1, read_register_2, write_register, write_data, read_data_1, read_data_2, RegWrite);

	/// -----------
	/// Input Ports
	
	input        clock 			       ; // Clock input
	input [4:0]  read_register_1 ; // First  register selection
	input [4:0]  read_register_2 ; // Second register selection
	input [4:0]  write_register  ; // Destination register selection
	input [31:0] write_data      ; // Data result to write
	input        RegWrite        ; // Control Signal
	
	/// ------------
	/// Output Ports
	
	output reg [31:0] read_data_1 ; // Read data 1 output
	output reg [31:0] read_data_2 ; // Read data 2 output
	
	/// -------------------
	/// Internal Components
	
	reg [31:0] registers [31:0]  ;
	reg [7:0]  divider           ;
	
	/// -------------
	/// Initial Block
	
  initial begin
    
    divider       =  8'b00000000;
    read_data_1   = 32'h00000000;
    read_data_2   = 32'h00000000;
    registers[0]  = 32'h00000000;
    registers[1]  = 32'h00000000;
    registers[2]  = 32'h00000000;
    registers[3]  = 32'h00000000;
    registers[4]  = 32'h00000000;
    registers[5]  = 32'h00000000;
    registers[6]  = 32'h00000000;
    registers[7]  = 32'h00000000;
    registers[8]  = 32'h00000000;
    registers[9]  = 32'h00000000;
    registers[10] = 32'h00000000;
    registers[11] = 32'h00000000;
    registers[12] = 32'h00000000;
    registers[13] = 32'h00000000;
    registers[14] = 32'h00000000;
    registers[15] = 32'h00000000;
    registers[16] = 32'h00000000;
    registers[17] = 32'h00000000;
    registers[18] = 32'h00000000;
    registers[19] = 32'h00000000;
    registers[20] = 32'h00000000;
    registers[21] = 32'h00000000;
    registers[22] = 32'h00000000;
    registers[23] = 32'h00000000;
    registers[24] = 32'h00000000;
    registers[25] = 32'h00000000;
    registers[26] = 32'h00000000;
    registers[27] = 32'h00000000;
    registers[28] = 32'h00000000;
    registers[29] = 32'h00000000;
    registers[30] = 32'h00000000;
    registers[31] = 32'h00000000;
    
  end
  
  /// ----------------
  /// Sequential Logic
  
  always@(posedge clock) begin
 	  
 	  if(divider == 8'b00000010) begin
	      
	      read_data_1 <= registers[read_register_1];
	      read_data_2 <= registers[read_register_2];
	      
	      divider++;
	    
	  end else if(divider == 8'b00000100) begin

      if(RegWrite == 1'b1) begin
      
        registers[write_register] <= write_data;
        
      end
	    
	    divider <= 8'b00000000;
	    
	  end else begin
	    
	    divider++;
	    
	  end  
    
  end

endmodule