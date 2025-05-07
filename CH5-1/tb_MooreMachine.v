`timescale  	 1ns / 100ps

module tb_MooreMachine;
	reg clk;
	reg nRst;
	reg i, iM, iN;
	wire oY;

	MooreMachine U0 (clk, nRst, i, iM, iN, oY);

	initial
	begin
			nRst = 1; i = 0; iM = 1; iN = 0;	
		#20 nRst = 0;
		#40 nRst = 1;
		#40 i = 1;
		#40 i = 0;
	end

	initial
	begin
		clk = 0;
		forever
		begin
			#10 clk = ~clk;
		end
	end
endmodule
