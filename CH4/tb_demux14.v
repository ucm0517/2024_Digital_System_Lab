 `timescale		1ns / 100ps
 
module tb_demux14;
	reg			rI;
	reg [1:0]	rSel;
	wire [3:0]	wY;
	
	demux14_if U0 (rSel, rI, wY);
	
	initial begin
			rI = 1'b0;
		#800 rI = 1'b1;
	end

	initial
	rSel = 2'b00;
	
	always 
	#200 rSel = rSel + 1;
endmodule
