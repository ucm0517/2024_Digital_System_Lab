module DeMux_Case(iS, I, oY);
	input[1:0] iS;
	input I;
	output[3:0] oY;
	reg[3:0] oY;
	
	always @ (iS or I)
	begin
	
		case(iS)
			2'b00 : oY= {1'bz, 1'bz, 1'bz, I};
			2'b01 : oY= {1'bz, 1'bz, I, 1'bz};
			2'b10 : oY= {1'bz, I, 1'bz, 1'bz};
			2'b11 : oY= {I, 1'bz, 1'bz, 1'bz};
		endcase
	end
endmodule