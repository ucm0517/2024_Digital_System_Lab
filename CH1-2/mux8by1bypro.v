module mux8by1bypro (output reg y, input [2:0] s, input [0:7] d);
// 8:1 멀티플렉서(MUX)를 구현하는 모듈
// 출력: y (선택된 입력 값이 전달됨)
// 입력: s (3비트 선택 신호), d (8비트 데이터 입력)

	always @(*)
	begin
		// 선택 신호 s에 따라 y에 d의 해당 비트 값 할당
		if (s == 3'b000) y = d[0];  // 선택 신호가 000일 때 d[0]을 출력
		else if (s == 3'b001) y = d[1];  // 선택 신호가 001일 때 d[1]을 출력
		else if (s == 3'b010) y = d[2];  // 선택 신호가 010일 때 d[2]을 출력
		else if (s == 3'b011) y = d[3];  // 선택 신호가 011일 때 d[3]을 출력
		else if (s == 3'b100) y = d[4];  // 선택 신호가 100일 때 d[4]을 출력
		else if (s == 3'b101) y = d[5];  // 선택 신호가 101일 때 d[5]을 출력
		else if (s == 3'b110) y = d[6];  // 선택 신호가 110일 때 d[6]을 출력
		else y = d[7];  // 선택 신호가 111일 때 d[7]을 출력
	end
endmodule
 
`timescale 1ns / 100ps          // 시뮬레이션 시간 단위: 1ns, 시간 정밀도: 100ps

module tb_mux8by1bypro;
	reg [0:7] rd;               // 8비트 데이터 입력 (MUX의 데이터 입력 d에 연결)
	reg [2:0] rs;               // 3비트 선택 신호 (MUX의 선택 신호 s에 연결)
	wire wy;                     // MUX의 출력 y에 연결된 와이어
	
	mux8by1bypro U0 (wy, rs, rd); // mux8by1bypro 모듈 인스턴스화 및 포트 연결

	// 초기 데이터 입력 설정
	initial rd = 8'b00000000;    // 초기 rd 값을 8'b00000000으로 설정

	// 각 비트를 일정 주기로 반전하여 rd 입력을 변화시키는 로직
	always #2 rd[0] = ~rd[0];    // 2ns마다 rd[0] 반전
	always #4 rd[1] = ~rd[1];    // 4ns마다 rd[1] 반전
	always #8 rd[2] = ~rd[2];    // 8ns마다 rd[2] 반전
	always #16 rd[3] = ~rd[3];   // 16ns마다 rd[3] 반전
	always #32 rd[4] = ~rd[4];   // 32ns마다 rd[4] 반전
	always #64 rd[5] = ~rd[5];   // 64ns마다 rd[5] 반전
	always #128 rd[6] = ~rd[6];  // 128ns마다 rd[6] 반전
	always #256 rd[7] = ~rd[7];  // 256ns마다 rd[7] 반전

	// 초기 선택 신호 설정
	initial rs = 3'b000;         // 초기 선택 신호 rs 값을 3'b000으로 설정
	always #500 rs = rs + 1;     // 500ns마다 rs를 1씩 증가하여 선택 신호 변경
endmodule
