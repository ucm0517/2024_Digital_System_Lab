 `timescale			1ns/100ps
 module tb_enc42;
	 reg [3:0] rA;
	 wire [1:0] wY;
	 
	 enc42_if U0 (rA, wY);
	 
	 always
	 begin
		 rA = 4'b0001;
		 #200 rA = 4'b0010;
		 #200 rA = 4'b0100;
		 #200 rA = 4'b1000;
		 #200;
	end
 endmodule