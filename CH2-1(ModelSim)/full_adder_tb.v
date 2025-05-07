`timescale 1ns/100ps
module full_adder_tb;

	reg rX, rY, rCin ;
	
	full_adder U1(rX, rY, rCin, wSum, wCout);
	
	initial begin
		rX = 0; rY = 0; rCin = 0;
		#100 rX = 1;
		#100 rX = 0; rY = 1; rCin = 0;
		#100 rX = 1; rY = 1; rCin = 0;
		#100 rX = 0; rY = 0; rCin = 1;
		#100 rX = 1; rCin = 1;
		#100 rX = 0; rY = 1; rCin = 1;
		#100 rX = 1; rY = 1; rCin = 1;
		#100 rX = 0; rY = 0; rCin = 0;
		
	end

endmodule