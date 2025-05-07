module dec24_if(iA, oY);

	input [1:0] iA;
	output [3:0] oY;
	reg [3:0] oY;
 
	always @(iA) 
	begin
		if(iA == 0) oY= 4'b0001;
			else if(iA ==1) oY= 4'b0010;
			else if(iA ==2) oY= 4'b0100;
			else if(iA ==3) oY= 4'b1000;
			else oY= 4'bx;
	end
endmodule