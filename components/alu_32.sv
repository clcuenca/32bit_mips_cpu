/// 32-bit ALU
/// Author: Carlos L. Cuenca
/// Created: 07/30/2021

/// ------------------
/// Include Statements

module alu_32(data_in_0, data_in_1, alu_control, zero, result);

	/// -----------
	/// Input Ports
	
	input signed [31:0] data_in_0     ; // First operand
	input signed [31:0] data_in_1     ; // Second operand
	input[ 3:0] alu_control   ; // Operation Selection
	
	/// ------------
	/// Output Ports
	
	output logic [31:0] result ; // Operation result
	output logic        zero   ; // Zero Signal
	
	/// --------------
	/// Internal Buses
	
	wire carry_out                ; // Carry Out
	wire subtract                 ; // Subtract driver
	wire[31:0] data_in_1_         ; // Inverted data in
	wire[31:0] data_in_1_select   ; // Selected second operand
	wire[31:0] alu_result         ; // ALU Cell result
	wire[31:0] carry_out_internal ; // Internal Carry Out signals
	
	/// -------------------
	/// Internal Components

	// Operand 2 selection
	mux_two_one sub_mux[31:0](.data_in_0(data_in_1),
									  .data_in_1(data_in_1_),
									  .select(subtract),
									  .data_out(data_in_1_select));
	
	// ALU functional cells
	alu_1 cells[31:0](.data_in_0(data_in_0),
					.data_in_1(data_in_1_select),
					.alu_control(alu_control),
					.carry_in({carry_out_internal[30:0], subtract}),
					.carry_out(carry_out_internal),
					.result(alu_result));

	/// -----------------
	/// Assign Statements
	
	assign data_in_1_ = ~data_in_1;
	assign carry_out  = carry_out_internal[31];
	assign subtract   =  (~alu_control[3] &  alu_control[2] &  alu_control[1] & ~alu_control[0]);
	
  always@* begin
  
    if((alu_control == 4'b0000) || (alu_control == 4'b0001) || 
        (alu_control == 4'b0010) || (alu_control == 4'b0110) ||
        (alu_control == 4'b1100)) begin
      
      result = alu_result;
        
    end else if(alu_control == 4'b0111) begin

      if(data_in_0 < data_in_1) begin

      	result = 32'h00000001;

     	end else begin

     		result = 32'h00000000;

      end
        
    end

    if(data_in_0 == data_in_1) begin

    	zero = 32'h00000001;

    end else begin

    	zero = 32'h00000000;

    end

  end 

endmodule