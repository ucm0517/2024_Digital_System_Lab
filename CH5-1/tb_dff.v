`timescale 1ns / 100ps
module tb_dff;
	reg rClk, rD;
	wire wQ;
	d_ff U0 (rClk, rD, wQ);

	initial
	begin
		rClk= 1'b0;
		forever #100 rClk= ~rClk;
	end

	initial
	begin
		rD= 1'b0;
		forever
		begin
			#150 rD= 1'b1;
			#200 rD= 1'b0;
			#300 rD= 1'b1;
			#200 rD= 1'b0;
			#100 rD= 1'b1;
			#200 rD= 1'b0;
		end
	end
endmodule