 `timescale		 1ns / 100ps
 module tb_mux41;
	 reg [3:0] rA, rB, rC, rD;
	 reg [1:0] rSel;
	 wire [3:0] wY;

	mux41_if U0 (rSel, rA, rB, rC, rD, wY);
	initial
	begin
		 rA = 4'b0001; rB = 4'b0010;
		 rC = 4'b0100; rD = 4'b1000;
		#800
		 rA = 4'b1100; rB = 4'b0011;
		 rC = 4'b0110; rD = 4'b1001;
	 end
	initial 
		rSel = 2'b00;
 
	always 
		#200 rSel = rSel + 1; 

endmodule