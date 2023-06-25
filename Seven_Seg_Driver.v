module Seven_Seg_Driver(
	input clk,
	input clr,
	input [3:0] in1,
	input [3:0] in2,
	input [3:0] in3,
	input [3:0] in4,
	output reg [6:0] seg1,
	output reg [6:0] seg2,
	output reg [6:0] seg3,
	output reg [6:0] seg4,
	output reg clkLED
	);
	reg [25:0] count;
	reg [3:0] seg;
	reg [12:0] segclk;	
	
	always @ (posedge clk)
	
	begin
	segclk <= segclk + 1'b1;
		if(count == 49999999) begin //Time is up (50MHz)
		 count <= 0;             //Reset count register
		 clkLED <= ~clkLED;            //Toggle led (in each second)
	end else begin
		 count <= count + 1;     //Counts 50MHz clock
		 end
	
	end
	
	always @ (posedge segclk[12:0] or posedge clr)
	begin
		if (clr == 1) begin 
										//reset 7 segments to zero
			seg1[6:0] =7'b1000000;
			seg2[6:0] =7'b1000000;
			seg3[6:0] =7'b1000000;
			seg4[6:0] =7'b1000000;
			
			
		end
		
		else begin
			case(in4)								//based on input, display the ones

			//active low 7segment
			
			4'b0000: seg1[6:0] = 7'b1000000; 	//0
			4'b0001: seg1[6:0] = 7'b1111001; 	//1
			4'b0010: seg1[6:0] = 7'b0100100;		//2
			
			4'b0011: seg1[6:0] = 7'b0110000;		//3
			4'b0100: seg1[6:0] = 7'b0011001;		//4
			4'b0101: seg1[6:0] = 7'b0010010;		//5
			
			4'b0110: seg1[6:0] = 7'b0000010;		//6
			4'b0111: seg1[6:0] = 7'b1111000;		//7
			4'b1000: seg1[6:0] = 7'b0000000;		//8
			
			4'b1001: seg1[6:0] = 7'b0010000;		//9
			default: seg1[6:0] = 7'b1000000;		//turn 7 segment off
			endcase
			
			case(in3)								//based on input, display the tens

			//active low 7segment
			
			4'b0000: seg2[6:0] = 7'b1000000; 	//0
			4'b0001: seg2[6:0] = 7'b1111001; 	//1
			4'b0010: seg2[6:0] = 7'b0100100;		//2
			
			4'b0011: seg2[6:0] = 7'b0110000;		//3
			4'b0100: seg2[6:0] = 7'b0011001;		//4
			4'b0101: seg2[6:0] = 7'b0010010;		//5
			
			4'b0110: seg2[6:0] = 7'b0000010;		//6
			4'b0111: seg2[6:0] = 7'b1111000;		//7
			4'b1000: seg2[6:0] = 7'b0000000;		//8
			
			4'b1001: seg2[6:0] = 7'b0010000;		//9
			default: seg2[6:0] = 7'b1000000;		//turn 7 segment off

			endcase
			
			case(in2)								//based on input, display the hundreds

			//active low 7segment
			
			4'b0000: seg3[6:0] = 7'b1000000; 	//0
			4'b0001: seg3[6:0] = 7'b1111001; 	//1
			4'b0010: seg3[6:0] = 7'b0100100;		//2
			
			4'b0011: seg3[6:0] = 7'b0110000;		//3
			4'b0100: seg3[6:0] = 7'b0011001;		//4
			4'b0101: seg3[6:0] = 7'b0010010;		//5
			
			4'b0110: seg3[6:0] = 7'b0000010;		//6
			4'b0111: seg3[6:0] = 7'b1111000;		//7
			4'b1000: seg3[6:0] = 7'b0000000;		//8
			
			4'b1001: seg3[6:0] = 7'b0010000;		//9
			default: seg3[6:0] = 7'b1000000;		//turn 7 segment off
			endcase
			
			case(in1)								//based on input, display the thousands

			//active low 7segment
			
			4'b0000: seg4[6:0] = 7'b1000000; 	//0
			4'b0001: seg4[6:0] = 7'b1111001; 	//1
			4'b0010: seg4[6:0] = 7'b0100100;		//2
			
			4'b0011: seg4[6:0] = 7'b0110000;		//3
			4'b0100: seg4[6:0] = 7'b0011001;		//4
			4'b0101: seg4[6:0] = 7'b0010010;		//5
			
			4'b0110: seg4[6:0] = 7'b0000010;		//6
			4'b0111: seg4[6:0] = 7'b1111000;		//7
			4'b1000: seg4[6:0] = 7'b0000000;		//8
			
			4'b1001: seg4[6:0] = 7'b0010000;		//9
			default: seg4[6:0] = 7'b1000000;		//turn 7 segment off
			endcase
					
		end
	end
	endmodule