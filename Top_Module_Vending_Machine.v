module Top_Module_Vending_Machine(
	
	input clk,
	input btnR,		//reset
	input btnB,		//buy
	input btnQ,		//25cents - quarter
	input btnD,		//100cents- dollar
	input [7:0]sw,
	output [7:0]led,	//product bought [3:0], out of stock [7:4]
	output [6:0]seg1,
	output [6:0]seg2,
	output [6:0]seg3,
	output [6:0]seg4,
	output clkLED,
	output refundLED
	);
	
	wire [11:0] money;
	wire deb_btnB, deb_btnQ, deb_btnD;

	Debounce dbnB(clk, btnB, deb_btnB);
	Debounce dbnQ(clk, btnQ, deb_btnQ);
	Debounce dbnD(clk, btnD, deb_btnD);
	
	wire [3:0] thousands, hundreds, tens, ones;
	
	
	Binary_to_BCD BCD(money[11:0],thousands[3:0],hundreds[3:0],tens[3:0],ones[3:0]);

	Seven_Seg_Driver SSD(clk,deb_btnB,thousands[3:0],hundreds[3:0],tens[3:0],ones[3:0],seg1[6:0],seg2[6:0],seg3[6:0],seg4[6:0],clkLED);
	
	VendingMachineFPGA VM(clk, btnR, deb_btnQ, deb_btnD, sw[3:0], deb_btnB, sw[7:4], money[11:0], led[3:0], led[7:4], refundLED);
	endmodule