module ex1_3 (
	output y_out,             // 출력 y_out: 상태가 S4일 때 1로 설정
	output [2:0] cur_state,   // 현재 상태를 나타내는 3비트 출력
	input x_in, clock, reset  // 입력 신호: x_in(입력), clock(클럭), reset(리셋)
 );
	
	reg [2:0] state;            // 상태를 저장하는 3비트 레지스터
	parameter S0 = 3'b000,      // 상태 S0을 3비트 000으로 정의
	          S1 = 3'b001,      // 상태 S1을 3비트 001로 정의
	          S2 = 3'b010,      // 상태 S2을 3비트 010으로 정의
	          S3 = 3'b011,      // 상태 S3을 3비트 011로 정의
	          S4 = 3'b100;      // 상태 S4을 3비트 100으로 정의
	
	// 클럭 상승 엣지 또는 리셋 신호의 하강 엣지에서 상태 전이
	always @ (posedge clock, negedge reset)
		if (reset == 0) 
			state <= S0;       // 리셋 신호가 0이면 S0으로 초기화
		else 
			case (state)       // 현재 상태에 따라 다음 상태 결정
				S0 : if (x_in) state <= S1; else state <= S0;  // x_in이 1이면 S1으로 전이, 아니면 S0 유지
				S1 : if (x_in) state <= S2; else state <= S1;  // x_in이 1이면 S2로 전이, 아니면 S1 유지
				S2 : if (x_in) state <= S3; else state <= S2;  // x_in이 1이면 S3로 전이, 아니면 S2 유지
				S3 : if (x_in) state <= S4; else state <= S3;  // x_in이 1이면 S4로 전이, 아니면 S3 유지
				S4 : if (x_in) state <= S0; else state <= S4;  // x_in이 1이면 S0으로 전이, 아니면 S4 유지
			endcase
		
	assign cur_state = state;          // 현재 상태를 cur_state에 할당하여 출력
	assign y_out = (state == S4);      // 현재 상태가 S4일 때 y_out을 1로 설정
endmodule

`timescale 1ns/100ps        // 시뮬레이션 시간 단위: 1ns, 시간 정밀도: 100ps
module tb_ex1_3;
	reg rclock, rreset, rx_in;  // rclock: 클럭, rreset: 리셋, rx_in: 입력 신호
	wire wy_out;                // 모듈의 출력 y_out에 연결된 와이어
	wire [2:0] wcur_stat;       // 모듈의 cur_state 출력에 연결된 와이어
	
	ex1_3 U0 (wy_out, wcur_stat, rx_in, rclock, rreset); // 모듈 인스턴스화 및 포트 연결
	
	initial
		rclock = 0;            // 시뮬레이션 시작 시 클럭 초기화
	always #10 rclock = ~rclock;  // 10ns마다 클럭 반전하여 20ns 주기(50MHz) 클럭 생성
	
	initial
	begin
		rreset = 1;            // 시뮬레이션 시작 시 리셋 비활성화
		#50 rreset = 0;        // 50ns 후 리셋 활성화 (S0으로 초기화)
		#100 rreset = 1;       // 100ns 후 리셋 비활성화 (정상 동작 시작)
	end
	
	initial
	begin
		rx_in = 0;             // 초기 rx_in 값 설정
		#1000 rx_in = 1;       // 1000ns 후 rx_in을 1로 변경
		#1000 rx_in = 0;       // 2000ns 후 rx_in을 0으로 변경
		#1000 rx_in = 1;       // 3000ns 후 rx_in을 1로 변경
		#1000 rx_in = 0;       // 4000ns 후 rx_in을 0으로 변경
		#1000 rx_in = 1;       // 5000ns 후 rx_in을 1로 변경   그 이후는 1로 출력(begin end 블록은 한 번 실행된 후 종료)
	end
endmodule