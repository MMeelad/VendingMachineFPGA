module Decoder_7_segment(

	input[3:0] in,
	output reg [6:0] seg
	);
	

	always @ (in)
	begin
	case(in)
	
	//active low 7segment
	
	4'b0000: seg[6:0] = 7'b0000001; 		//0
	4'b0001: seg[6:0] = 7'b1001111; 		//1
	4'b0010: seg[6:0] = 7'b0010010;		//2
	
	4'b0011: seg[6:0] = 7'b0000110;		//3
	4'b0100: seg[6:0] = 7'b1001100;		//4
	4'b0101: seg[6:0] = 7'b0100100;		//5
	
	4'b0110: seg[6:0] = 7'b0100000;		//6
	4'b0111: seg[6:0] = 7'b0001111;		//7
	4'b1000: seg[6:0] = 7'b0000000;		//8
	
	4'b1001: seg[6:0] = 7'b0000100;		//9
	default : seg[6:0] = 7'b1111111;		//off 7seg
	
	endcase
	end
	
	endmodule