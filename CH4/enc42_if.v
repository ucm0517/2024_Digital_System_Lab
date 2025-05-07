module enc42_if (iA, oY);
	input [3:0] iA;
	output [1:0] oY;
	reg [1:0] oY;

	always @(iA)
	begin
	if (iA == 4'b0001) oY= 0;
		else if(iA == 4'b0010) oY= 1;
		else if(iA == 4'b0100) oY= 2;
		else if(iA == 4'b1000) oY= 3;
		else oY= 2'bx;
	end
endmodule