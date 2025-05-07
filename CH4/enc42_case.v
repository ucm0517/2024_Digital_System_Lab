module enc42_case (iA, oY);

	input [3:0] iA;
	output [1:0] oY;
	reg [1:0] oY;

	always @(iA)
	begin

	case (iA)
		4'b0001 : oY= 0;
		4'b0010 : oY= 1;
		4'b0100 : oY= 2; 
		4'b1000 : oY= 3;
		default : oY= 2'bx;
	endcase
end
endmodule