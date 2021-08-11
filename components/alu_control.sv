/// ALU Control
/// @author: Carlos L. Cuenca

module alu_control(ALUOp, instruction, control);

	/// -----------
	/// Input Ports
	
	input[2:0] ALUOp			; // 3-Bit Control Input
	input[5:0] instruction	; // 6-bit Opcode
	
	/// ------------
	/// Output Ports
	
	output logic [3:0] control ; // ALU Control Signal
	
	/// ---------------------
	/// Assignment Statements
	
	always @* begin
	
		// ADD
		if(ALUOp == 3'b010 && instruction == 6'b100000) begin
		
			control = 4'b0010;
		
		// SUB
		end else if(ALUOp == 3'b010 && instruction == 6'b100010) begin
		
			control = 4'b0110;
		
		// AND
		end else if(ALUOp == 3'b010 && instruction == 6'b100100) begin
	
			control = 4'b0000;

		// OR
		end else if(ALUOp == 3'b010 && instruction == 6'b100101) begin
	
			control = 4'b0001;

		// SLT
		end else if(ALUOp == 3'b010 && instruction == 6'b101010) begin
	
			control = 4'b0111;

		// NOR
		end else if (ALUOp == 3'b010 && instruction == 6'b100110) begin
		
			control = 4'b1100;
		
		// LW, SW
		end else if (ALUOp == 3'b000) begin
		
			control = 4'b0010;
		
		// BEQ
		end else if (ALUOp == 3'b001) begin
		
			control = 4'b0110;
		
		// ANDI
		end else if (ALUOp == 3'b101) begin
		
			control = 4'b0000;
		
		// ADDI
		end else if (ALUOp == 3'b110) begin
		
			control = 4'b0010;
		
		// ORI
		end else if (ALUOp == 3'b111) begin
		
			control = 4'b0001;
		
		end
	
	end
	
endmodule