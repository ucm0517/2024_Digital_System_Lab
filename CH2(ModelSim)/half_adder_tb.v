`timescale 1ns/100ps
module half_adder_tb ;
	reg rA, rB;

	half_adder U0(rA, rB, wSum, wCout);

	initial begin
	rA = 0; rB = 0;
		#100 rA = 1;
		#100 rA = 0; rB = 1;
		#100 rA = 1;
		#100 rA = 0; rB = 0;
	end
endmodule