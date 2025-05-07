primitive mux2by1(output y, input s, a, b);
	//	s	a	b	:	y        (y = (s==0) ? b : a)
	table
		0	0	0	:	0;
		0	0	1	:	1;
		0	1	0	:	0;
		0	1	1	:	1;
		1	0	0	:	0;
		1	0	1	:	0;
		1	1	0	:	1;
		1	1	1	:	1;
	endtable
endprimitive
			
module mux4by1bycom (output y, input [1:0] s, input [0:3] d);
	wire	t1, t2;

	mux2by1	C1	(t1, s[0], d[1], d[0]),
				C2	(t2, s[0], d[3], d[2]),
				C3	(y, s[1], t2, t1);
	
endmodule

`timescale 1ns / 100ps
module tb_mux4by1bycom;
    reg [0:3] rd;      // 4비트 레지스터 rd를 선언. 멀티플렉서의 데이터 입력으로 사용.
    reg [1:0] rs;      // 2비트 레지스터 rs를 선언. 멀티플렉서의 선택 신호로 사용.
    wire wy;           // 멀티플렉서의 출력을 저장할 와이어.

    mux4by1bycom u0 (wy, rs, rd); // 멀티플렉서 인스턴스 u0를 생성하고, wy, rs, rd를 연결.

    initial begin
        rd = 4'b0000;  // rd 초기값을 0000으로 설정
        always #2 rd[0] = ~rd[0]; // 2ns마다 rd[0]의 값을 반전
        always #4 rd[1] = ~rd[1]; // 4ns마다 rd[1]의 값을 반전
        always #8 rd[2] = ~rd[2]; // 8ns마다 rd[2]의 값을 반전
        always #16 rd[3] = ~rd[3]; // 16ns마다 rd[3]의 값을 반전
    end

    initial begin
        rs = 2'b00;   // rs 초기값을 00으로 설정
        always #200 rs = rs + 1; // 200ns마다 rs의 값을 1씩 증가시켜 선택 신호가 순차적으로 변함
    end
endmodule
