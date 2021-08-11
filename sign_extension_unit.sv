/// 16 to 32 bit Sign Extension Unit
/// @author: Carlos L. Cuenca

module sign_extension_unit_16_32(data_in, data_out);

	/// -----------
	/// Input Ports

	input[15:0] data_in; // 16-bit input

	/// ------------
	/// Output Ports

	output[31:0] data_out; // 32-bit Output

	/// -----------------
	/// Assign Statements

	assign data_out[ 0] = data_in[ 0];
	assign data_out[ 1] = data_in[ 1];
	assign data_out[ 2] = data_in[ 2];
	assign data_out[ 3] = data_in[ 3];
	assign data_out[ 4] = data_in[ 4];
	assign data_out[ 5] = data_in[ 5];
	assign data_out[ 6] = data_in[ 6];
	assign data_out[ 7] = data_in[ 7];
	assign data_out[ 8] = data_in[ 8];
	assign data_out[ 9] = data_in[ 9];
	assign data_out[10] = data_in[10];
	assign data_out[11] = data_in[11];
	assign data_out[12] = data_in[12];
	assign data_out[13] = data_in[13];
	assign data_out[14] = data_in[14];
	assign data_out[15] = data_in[15];
	assign data_out[16] = data_in[15];
	assign data_out[17] = data_in[15];
	assign data_out[18] = data_in[15];
	assign data_out[19] = data_in[15];
	assign data_out[20] = data_in[15];
	assign data_out[21] = data_in[15];
	assign data_out[22] = data_in[15];
	assign data_out[23] = data_in[15];
	assign data_out[24] = data_in[15];
	assign data_out[25] = data_in[15];
	assign data_out[26] = data_in[15];
	assign data_out[27] = data_in[15];
	assign data_out[28] = data_in[15];
	assign data_out[29] = data_in[15];
	assign data_out[30] = data_in[15];
	assign data_out[31] = data_in[15];

endmodule