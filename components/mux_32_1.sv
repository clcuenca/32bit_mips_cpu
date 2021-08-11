/// 32-to-1 Multiplexer
/// Author: Carlos L. Cuenca

module mux_32_1 (select, data_in, data_out);

	/// -----------
	/// Input Ports
	
	input [4 :0] select  ; // Output Selection
	input [31:0] data_in ; // Data Input
	
	/// ------------
	/// Output Ports
	
	output data_out; // Data output
	
	/// -----------------
	/// Assign Statements
	
	assign data_out = (~select[4] & ~select[3] & ~select[2] & ~select[1] & ~select[0] & data_in[ 0]) |
							(~select[4] & ~select[3] & ~select[2] & ~select[1] &  select[0] & data_in[ 1]) |
							(~select[4] & ~select[3] & ~select[2] &  select[1] & ~select[0] & data_in[ 2]) |
							(~select[4] & ~select[3] & ~select[2] &  select[1] &  select[0] & data_in[ 3]) |
							(~select[4] & ~select[3] &  select[2] & ~select[1] & ~select[0] & data_in[ 4]) |
							(~select[4] & ~select[3] &  select[2] & ~select[1] &  select[0] & data_in[ 5]) |
							(~select[4] & ~select[3] &  select[2] &  select[1] & ~select[0] & data_in[ 6]) |
							(~select[4] & ~select[3] &  select[2] &  select[1] &  select[0] & data_in[ 7]) |
							(~select[4] &  select[3] & ~select[2] & ~select[1] & ~select[0] & data_in[ 8]) |
							(~select[4] &  select[3] & ~select[2] & ~select[1] &  select[0] & data_in[ 9]) |
							(~select[4] &  select[3] & ~select[2] &  select[1] & ~select[0] & data_in[10]) |
							(~select[4] &  select[3] & ~select[2] &  select[1] &  select[0] & data_in[11]) |
							(~select[4] &  select[3] &  select[2] & ~select[1] & ~select[0] & data_in[12]) |
							(~select[4] &  select[3] &  select[2] & ~select[1] &  select[0] & data_in[13]) |
							(~select[4] &  select[3] &  select[2] &  select[1] & ~select[0] & data_in[14]) |
							(~select[4] &  select[3] &  select[2] &  select[1] &  select[0] & data_in[15]) |
							( select[4] & ~select[3] & ~select[2] & ~select[1] & ~select[0] & data_in[16]) |
							( select[4] & ~select[3] & ~select[2] & ~select[1] &  select[0] & data_in[17]) |
							( select[4] & ~select[3] & ~select[2] &  select[1] & ~select[0] & data_in[18]) |
							( select[4] & ~select[3] & ~select[2] &  select[1] &  select[0] & data_in[19]) |
							( select[4] & ~select[3] &  select[2] & ~select[1] & ~select[0] & data_in[20]) |
							( select[4] & ~select[3] &  select[2] & ~select[1] &  select[0] & data_in[21]) |
							( select[4] & ~select[3] &  select[2] &  select[1] & ~select[0] & data_in[22]) |
							( select[4] & ~select[3] &  select[2] &  select[1] &  select[0] & data_in[23]) |
							( select[4] &  select[3] & ~select[2] & ~select[1] & ~select[0] & data_in[24]) |
							( select[4] &  select[3] & ~select[2] & ~select[1] &  select[0] & data_in[25]) |
							( select[4] &  select[3] & ~select[2] &  select[1] & ~select[0] & data_in[26]) |
							( select[4] &  select[3] & ~select[2] &  select[1] &  select[0] & data_in[27]) |
							( select[4] &  select[3] &  select[2] & ~select[1] & ~select[0] & data_in[28]) |
							( select[4] &  select[3] &  select[2] & ~select[1] &  select[0] & data_in[29]) |
							( select[4] &  select[3] &  select[2] &  select[1] & ~select[0] & data_in[30]) |
							( select[4] &  select[3] &  select[2] &  select[1] &  select[0] & data_in[31]);
	
	

endmodule