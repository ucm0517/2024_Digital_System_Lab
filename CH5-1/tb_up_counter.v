`timescale 1ns / 100ps

module tb_up_counter;
	reg rClk, rRst;
	wire [7:0] wCount;

	up_counter  U0 (rClk, rRst, wCount);

	initial
		rClk= 0;
		always #10 rClk= ~rClk;

	initial
	begin
		rRst= 1;
		#5 rRst= 0;
		#10 rRst= 1;
		#100 rRst= 0;
		#10 rRst= 1;
	end
endmodule