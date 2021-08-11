/// 32-bit two-to-one multiplexer
/// @author: Carlos L. Cuenca

module mux_32_two_one (data_in_0, data_in_1, select, data_out);

	/// -----------
	/// Input Ports
	
	input[31:0] data_in_0; /// Data In 0
	input[31:0] data_in_1; /// Data In 1
	input       select   ; /// Data Selection 
	
	/// ------------	
	/// Output Ports
	
	output[31:0] data_out; /// The Selected data output

	/// -----------------
	/// Assign Statements
	
	assign data_out[ 0] = (data_in_0[ 0] & ~select) | (data_in_1[ 0] & select);
	assign data_out[ 1] = (data_in_0[ 1] & ~select) | (data_in_1[ 1] & select);
	assign data_out[ 2] = (data_in_0[ 2] & ~select) | (data_in_1[ 2] & select);
	assign data_out[ 3] = (data_in_0[ 3] & ~select) | (data_in_1[ 3] & select);
	assign data_out[ 4] = (data_in_0[ 4] & ~select) | (data_in_1[ 4] & select);
	assign data_out[ 5] = (data_in_0[ 5] & ~select) | (data_in_1[ 5] & select);
	assign data_out[ 6] = (data_in_0[ 6] & ~select) | (data_in_1[ 6] & select);
	assign data_out[ 7] = (data_in_0[ 7] & ~select) | (data_in_1[ 7] & select);
	assign data_out[ 8] = (data_in_0[ 8] & ~select) | (data_in_1[ 8] & select);
	assign data_out[ 9] = (data_in_0[ 9] & ~select) | (data_in_1[ 9] & select);
	assign data_out[10] = (data_in_0[10] & ~select) | (data_in_1[10] & select);
	assign data_out[11] = (data_in_0[11] & ~select) | (data_in_1[11] & select);
	assign data_out[12] = (data_in_0[12] & ~select) | (data_in_1[12] & select);
	assign data_out[13] = (data_in_0[13] & ~select) | (data_in_1[13] & select);
	assign data_out[14] = (data_in_0[14] & ~select) | (data_in_1[14] & select);
	assign data_out[15] = (data_in_0[15] & ~select) | (data_in_1[15] & select);
	assign data_out[16] = (data_in_0[16] & ~select) | (data_in_1[16] & select);
	assign data_out[17] = (data_in_0[17] & ~select) | (data_in_1[17] & select);
	assign data_out[18] = (data_in_0[18] & ~select) | (data_in_1[18] & select);
	assign data_out[19] = (data_in_0[19] & ~select) | (data_in_1[19] & select);
	assign data_out[20] = (data_in_0[20] & ~select) | (data_in_1[20] & select);
	assign data_out[21] = (data_in_0[21] & ~select) | (data_in_1[21] & select);
	assign data_out[22] = (data_in_0[22] & ~select) | (data_in_1[22] & select);
	assign data_out[23] = (data_in_0[23] & ~select) | (data_in_1[23] & select);
	assign data_out[24] = (data_in_0[24] & ~select) | (data_in_1[24] & select);
	assign data_out[25] = (data_in_0[25] & ~select) | (data_in_1[25] & select);
	assign data_out[26] = (data_in_0[26] & ~select) | (data_in_1[26] & select);
	assign data_out[27] = (data_in_0[27] & ~select) | (data_in_1[27] & select);
	assign data_out[28] = (data_in_0[28] & ~select) | (data_in_1[28] & select);
	assign data_out[29] = (data_in_0[29] & ~select) | (data_in_1[29] & select);
	assign data_out[30] = (data_in_0[30] & ~select) | (data_in_1[30] & select);
	assign data_out[31] = (data_in_0[31] & ~select) | (data_in_1[31] & select);
	
endmodule