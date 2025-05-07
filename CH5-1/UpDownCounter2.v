module UpDownCounter2 (reset, clk, UpDown, cnt_out);  
	input reset, clk, UpDown;
	output [1:0] cnt_out;
	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
	reg [1:0] state = S0;
	always @(posedge clk)  //동기식 리셋
	begin
		if (~reset)
			state <= S0; // 초기화 상태
		else 
			case (state)
			
				S0:
					if (UpDown) state <= S3; // Up이면 S3로 이동
					else state <= S1;       // Down이면 S1로 이동
				S1:
					if (UpDown) state <= S0; // Up이면 S0로 이동
					else state <= S2;       // Down이면 S2로 이동
				S2:
					if (UpDown) state <= S1; // Up이면 S1로 이동
					else state <= S3;       // Down이면 S3로 이동
				S3:
					if (UpDown) state <= S2; // Up이면 S2로 이동
					else state <= S0;       // Down이면 S0로 이동
			
			/*
				S0: state <= (UpDown) ? S3 : S1; // Up이면 S1, Down이면 S3
            S1: state <= (UpDown) ? S0 : S2; // Up이면 S2, Down이면 S0
            S2: state <= (UpDown) ? S1 : S3; // Up이면 S3, Down이면 S1
            S3: state <= (UpDown) ? S2 : S0; // Up이면 S0, Down이면 S2
						default: state <= S0; //태로 복귀
						*/
			endcase
	end
	assign cnt_out = state; // 현재 상태를 출력
endmodule