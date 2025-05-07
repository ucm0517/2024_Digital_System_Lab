module half_adder(iA, iB, oSum, oCout);
	input iA, iB;
	output oSum, oCout;
	
	assign oCout = iA & iB;
	assign oSum = iA ^ iB;
endmodule

