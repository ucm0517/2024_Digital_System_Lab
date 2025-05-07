`timescale		1ns/100ps

module tb_dec24;
	reg [1:0] rA;
	wire [3:0] wY;

	dec24_if U0 (rA, wY);

	always
	begin
		rA = 2'b00;
		#200 rA = 2'b01;
		#200 rA = 2'b10;
		#200 rA = 2'b11;
		#200;
	end
endmodule