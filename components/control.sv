/// MIPS Control Unit
/// author: Carlos L. Cuenca

module control(opcode, RegDST, Jump, Branch, MemRead, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite);

	/// -----------
	/// Input Ports
	
	input[5:0] opcode; // The Instruction OpCode
	
	/// ------------
	/// Output Ports
	
	output logic       RegDST		  ; // Register Destination
	output logic       Jump  		  ; // Jump Signal
	output logic       Branch		  ; // Branch Signal
	output logic       MemRead 		; // For Load Word
	output logic       MemToReg 	; // Register Condition
	output logic [2:0] ALUOp			  ; // ALUOperation Signal
	output logic       MemWrite		; // For SW
	output	logic       ALUSrc		  ; // ALU Second Operand Signal
	output logic       RegWrite		; // Register File Write
	
	/// -----------------
	/// Assign Statements
	
	always @* begin
	
		// ADD, SUB, OR, AND, SLT
		if(opcode == 6'b000000) begin
		
			RegDST 	 = 1'b1;
			ALUSrc 	 = 1'b0;
			MemToReg = 1'b0;
			RegWrite = 1'b1;
			MemRead  = 1'b0;
			MemWrite = 1'b0;
			Branch   = 1'b0;
			Jump     = 1'b0;
			ALUOp    = 3'b010;
		
		// LW
		end else if(opcode == 6'b100011) begin
		
			RegDST 	= 1'b0	;
			ALUSrc 	= 1'b1	;
			MemToReg = 1'b1	;
			RegWrite = 1'b1	;
			MemRead  = 1'b1	;
			MemWrite = 1'b0	;
			Branch   = 1'b0	;
			Jump     = 1'b0	;
			ALUOp    = 3'b000	;
	
		// SW
		end else if(opcode == 6'b101011) begin
		
			RegDST 	= 1'bx	;
			ALUSrc 	= 1'b1	;
			MemToReg = 1'bx	;
			RegWrite = 1'b0	;
			MemRead  = 1'b0	;
			MemWrite = 1'b1	;
			Branch   = 1'b0	;
			Jump     = 1'b0	;
			ALUOp    = 3'b000	;
		
		// BEQ
		end else if(opcode == 6'b000100) begin
		
			RegDST 	= 1'bx	;
			ALUSrc 	= 1'b0	;
			MemToReg = 1'bx	;
			RegWrite = 1'b0	;
			MemRead  = 1'b0	;
			MemWrite = 1'b0	;
			Branch   = 1'b1	;
			Jump     = 1'b0	;
			ALUOp    = 3'b001	;
		
		// J
		end else if(opcode == 6'b000010) begin
		
			RegDST 	= 1'bx	;
			ALUSrc 	= 1'bx	;
			MemToReg = 1'bx	;
			RegWrite = 1'b0	;
			MemRead  = 1'b0	;
			MemWrite = 1'b0	;
			Branch   = 1'b0	;
			Jump     = 1'b1	;
			ALUOp    = 3'bxxx	;
		
		// ANDI
		end else if(opcode == 6'b001100) begin
		
			RegDST 	 = 1'b0	;
			ALUSrc 	 = 1'b1	;
			MemToReg = 1'b0	;
			RegWrite = 1'b1	;
			MemRead  = 1'b0	;
			MemWrite = 1'b0	;
			Branch   = 1'b0	;
			Jump     = 1'b0	;
			ALUOp    = 3'b101	;
		
		// ADDI
		end else if(opcode == 6'b001000) begin
		
			RegDST   = 1'b0	;
			ALUSrc   = 1'b1	;
			MemToReg = 1'b0	;
			RegWrite = 1'b1	;
			MemRead	 = 1'b0	;
			MemWrite	= 1'b0	;
			Branch   = 1'b0   ; 
			Jump     = 1'b0	;
			ALUOp		  = 3'b110 ;
		
		// ORI
		end else if(opcode == 6'b001101) begin
	
			RegDST 	= 1'b0	;
			ALUSrc 	= 1'b1	;
			MemToReg = 1'b0	;
			RegWrite = 1'b1	;
			MemRead  = 1'b0	;
			MemWrite = 1'b0	;
			Branch	= 1'b0	;
			Jump		= 1'b0	;
			ALUOp		= 3'b111	;
	
		end
	
	end
	

endmodule