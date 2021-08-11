// 2-bit Shifter
// @author: Carlos L. Cuenca

module shifter_2_bit(data_in, data_out);

	/// -----------
	/// Input Ports

	input[31:0] data_in; // The input data

	/// ------------
	/// Output Ports

	output[31:0] data_out;

	assign data_out = {data_in[29:0], {2'b00}};

endmodule