/// 5-to-32 decoder
/// Author: Carlos L. Cuenca

module decoder_5_to_32(selection, out);

	/// -----------
	/// Input Ports

	input [4:0] selection;

	/// ------------
	/// Output Ports

	output [31:0] out;

	/// ----------------
	/// Assign Statments

	assign out[0]  = (selection == 5'b00000);
	assign out[1]  = (selection == 5'b00001);
	assign out[2]  = (selection == 5'b00010);
	assign out[3]  = (selection == 5'b00011);
	assign out[4]  = (selection == 5'b00100);
	assign out[5]  = (selection == 5'b00101);
	assign out[6]  = (selection == 5'b00110);
	assign out[7]  = (selection == 5'b00111);
	assign out[8]  = (selection == 5'b01000);
	assign out[9]  = (selection == 5'b01001);
	assign out[10] = (selection == 5'b01010);
	assign out[11] = (selection == 5'b01011);
	assign out[12] = (selection == 5'b01100);
	assign out[13] = (selection == 5'b01101);
	assign out[14] = (selection == 5'b01110);
	assign out[15] = (selection == 5'b01111);
	assign out[16] = (selection == 5'b10000);
	assign out[17] = (selection == 5'b10001);
	assign out[18] = (selection == 5'b10010);
	assign out[19] = (selection == 5'b10011);
	assign out[20] = (selection == 5'b10100);
	assign out[21] = (selection == 5'b10101);
	assign out[22] = (selection == 5'b10110);
	assign out[23] = (selection == 5'b10111);
	assign out[24] = (selection == 5'b11000);
	assign out[25] = (selection == 5'b11001);
	assign out[26] = (selection == 5'b11010);
	assign out[27] = (selection == 5'b11011);
	assign out[28] = (selection == 5'b11100);
	assign out[29] = (selection == 5'b11101);
	assign out[30] = (selection == 5'b11110);
	assign out[31] = (selection == 5'b11111);

endmodule