/// 4kb instruction Memory

module instruction_memory_4kb(clock, address, instruction);

	/// -----------
	/// Input Ports
	
	input 		 clock	 ; // Clock Signal
	input[31:0]  address	 ; // The address of the desired instruction
	integer      file_out ;
	
	/// ------------
	/// Output Ports
	
	output logic [31:0] instruction ; // The output Instruction
	
	/// -------------------
	/// Internal Components
	
	// 32-bit x 1024
	reg [31:0] memory [1023:0] ; // Sequential memory elements
	reg [7:0]  divider        ; // Clock Divider
	
	initial begin
    
    divider = 8'b00000000;
    
  end
	
	always @ (posedge clock) begin
	  
	  if(divider == 8'b00000001) begin
	    
	      // Assign the output to the word
		    // in the specified address
		    instruction = memory[address]; 
	    
	      divider++;
	    
	  end else if(divider == 8'b00000100) begin
	    
	    divider <= 8'b00000000;
	    
	  end else begin
	    
	    divider++;
	    
	  end

	end
	
	/// -------------
	/// Initial Block
	
	initial begin
	
		memory['h00000000] = 32'b001100_10000100000000000000000000; // andi $s0, $s0, 0x0000 # We want the first memory location (Array Size)
		memory['h00000004] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000008] = 32'b001000_10001100011111111111111111; // addi $s1, $s1, 0xffff # Bubble Sort call for the second to last index
		memory['h0000000c] = 32'b001100_10010100100000000000000000; // andi $s2, $s2, 0x0000 # Clear to store the comparator value
		memory['h00000010] = 32'b001101_10010100100000000000000001; // ori  $s2, $s2, 0x0001 # Set the comparator Value to 1
		memory['h00000014] = 32'b001100_10011100110000000000000000; // andi $s3, $s3, 0x0000 # Clear the First Index
		memory['h00000018] = 32'b001100_10100101000000000000000000; // LOOP1: andi $s4, $s4, 0x0000 # Clear the Second Index
		memory['h0000001c] = 32'b001100_10000100000000000000000000; // 			andi $s0, $s0, 0x0000 # Clear the address to the first element
		memory['h00000020] = 32'b001101_10000100000000000000000100; //    or   $s0, $s0, 0x0004 # Make Sure we don't overwrite the array size
		memory['h00000024] = 32'b000000_10001100110111100000100010; // 			sub  $t7, $s1, $s3    # Calculate the maximum element for the inner loop
		memory['h00000028] = 32'b100011_10000010000000000000000000; // 			LOOP2: lw   $t0, 0x0000($s0) # Load the first element
		memory['h0000002c] = 32'b100011_10000010010000000000000100; // 					 lw   $t1, 0x0004($s0) # Load the next element
		memory['h00000030] = 32'b000000_01001010001100000000101010; //					  slt  $t8, $t1, $t0    # Check if the next element is less than the current
		memory['h00000034] = 32'b000100_11000000000000000000000010; // 		beq  $t8, $zero, CHECK# Skip if the second element is not less than (Skip two Words)
		memory['h00000038] = 32'b101011_10000010010000000000000000; // 					 sw   $t1, 0x0000($s0) # Store the Second element
		memory['h0000003c] = 32'b101011_10000010000000000000000100; // 					 sw	$t0, 0x0004($s0) # Store the current element
		memory['h00000040] = 32'b001000_10000100000000000000000100; // 					 addi $s0, $s0, 0x0004 # Go to the next address
		memory['h00000044] = 32'b001000_10100101000000000000000001; //					  addi $s4, $s4, 0x0001 # Increment the index
		memory['h00000048] = 32'b000000_10100011111100000000101010; //					  slt  $t8, $s4, $t7 	  # Check if the index is still in range
		memory['h0000004c] = 32'b000100_11000100101111111111110110; // 					 beq  $t8, $s2, 0xfffa # Go back to Loop 2 if it is
		memory['h00000050] = 32'b001000_10011100110000000000000001; // 			 addi $s3, $s3, 0x0001 # Increment the outer index
		memory['h00000054] = 32'b000000_10011100011100000000101010; //     slt  $t8, $s3, $s1    # Check if the outer index is within range
		memory['h00000058] = 32'b000100_11000100101111111111101111; //     beq  $t8, $s2, 0xffef # Go back to loop 1 if it is
		memory['h0000005c] = 32'b001100_10000100000000000000000000; // andi $s0, $s0, 0x0000 # Clear the address to the first element
		memory['h00000060] = 32'b001101_10000100000000000000000100; // or   $s0, $s0, 0x0004 # Make Sure we don't overwrite the array size
		memory['h00000064] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000068] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h0000006c] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000070] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h00000074] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000078] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h0000007c] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000080] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h00000084] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000088] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h0000008c] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000090] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h00000094] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h00000098] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h0000009c] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000a0] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000a4] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000a8] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000ac] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000b0] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000b4] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000b8] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000bc] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000c0] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000c4] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000c8] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000cc] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000d0] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000d4] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000d8] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		memory['h000000dc] = 32'b100011_10000100010000000000000000; // lw   $s1, 0($s0)      # Load the Array Size
		memory['h000000e0] = 32'b001000_10000100000000000000000100; // addi $s0, $s0, 0x0004 # Go to the next address
		// DONE // 

	end
	
endmodule