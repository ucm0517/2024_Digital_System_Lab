module up_counter(iClk, iRst, oCount);
	input iClk, iRst;
	output [7:0] oCount;
	reg [7:0] oCount;

	always @(posedge iClk or negedge iRst)
	begin
		if (!iRst) oCount<= 0;
		else oCount<= oCount+ 1;
	end
endmodule