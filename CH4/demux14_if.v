module demux14_if(iS, I, oY);
	input[1:0] iS;
	input I;
	output[3:0] oY;
	reg[3:0] oY;

	always @ (iS or I)
	begin
	if (iS== 2'b00)
		oY= {1'bz, 1'bz, 1'bz, I};
	else if (iS== 2'b01)
		oY= {1'bz, 1'bz, I, 1'bz};
	else if (iS== 2'b10)
		oY= {1'bz, I, 1'bz, 1'bz};
	else
		oY= {I, 1'bz, 1'bz, 1'bz};
	end
endmodule