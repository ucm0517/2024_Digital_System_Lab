module dec24_case (iA, oY);

	input [1:0] iA;
	output [3:0] oY;
	reg [3:0] oY;

	always @(iA) 
	begin
		case (iA)
			0 : oY= 4'b0001;
			1 : oY= 4'b0010;
			2 : oY= 4'b0100;
			3 : oY= 4'b1000;
			default: oY= 4'bx;
	endcase
	end
endmodule