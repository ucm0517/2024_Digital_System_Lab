`timescale 1ns/100ps
module tb_ProfessorUpDownCounter;
	reg rstepClk;
	reg rreset;
	reg rUpDown;
	wire [1:0] wcnt_out;
	
	ProfessorUpDownCounter U0 (rreset, rstepClk, rUpDown, wcnt_out);
	
	initial begin
		rreset = 1; rUpDown = 0;
		#100 rreset = 0;
		#100 rreset = 1;
		#1000 rUpDown = 1;
	end
	
	initial begin
			rstepClk = 0;
			forever
			begin
				#50 rstepClk = ~rstepClk;
			end
		end
endmodule