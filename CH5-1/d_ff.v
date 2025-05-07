module d_ff(iClk, iD, oQ);
	input iD, iClk;
	output oQ;
	reg oQ;

	always @(posedge iClk)
		oQ<= iD;
endmodule