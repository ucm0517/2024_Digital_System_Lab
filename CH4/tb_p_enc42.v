`timescale 1ns / 100ps

module tb_p_enc42;
    reg [3:0] rA;
    wire [1:0] wY;

    p_enc42_if U0 (rA, wY);

    always
	 begin
		rA = 4'b0000; #200;  //    :  X
		rA = 4'b0001; #200;  // 출력: 00
		rA = 4'b0010; #200;  // 출력: 01
		rA = 4'b0011; #200;  // 출력: 01
		rA = 4'b0100; #200;  // 출력: 10
		rA = 4'b0101; #200;  // 출력: 10
		rA = 4'b0110; #200;  // 출력: 10
		rA = 4'b0111; #200;  // 출력: 10
		rA = 4'b1000; #200;  // 출력: 11
		rA = 4'b1001; #200;  // 출력: 11 
		rA = 4'b1010; #200;  // 출력: 11
		rA = 4'b1011; #200;  // 출력: 11
		rA = 4'b1100; #200;  // 출력: 11
		rA = 4'b1101; #200;  // 출력: 11
		rA = 4'b1110; #200;  // 출력: 11
		rA = 4'b1111; #200;  // 출력: 11
    end
endmodule

/*
module tb_p_enc42;

	reg [3:0] rA;
	wire [1:0] wY;

	p_enc42_if U0 (rA, wY);

	initial
	rA = 4'b0000;

	always
	#200 rA = rA + 1;
endmodule
*/