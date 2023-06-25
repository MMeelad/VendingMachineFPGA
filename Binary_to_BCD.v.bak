module Binary_to_BCD(
	input [11:0] binary,
	output reg [3:0] thousands,
	output reg [3:0] hundreds,
	output reg [3:0] tens,
	output reg [3:0] ones
	);

	reg [11:0] bcd_data = 0;
	always @ (binary)
	begin
	
	bcd_data = binary;
	thousands = bcd_data / 1000;
	bcd_data = bcd_data % 1000;
	
	hundreds = bcd_data / 100;
	bcd_data = bcd_data % 100;
	
	tens = bcd_data / 10;
	ones = bcd_data % 10;
	
	end
	endmodule