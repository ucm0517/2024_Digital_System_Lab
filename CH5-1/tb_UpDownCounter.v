`timescale 1ns / 100ps

module tb_UpDownCounter;
    reg reset;
    reg clk;
    reg UpDown;
    wire [1:0] cnt_out;

    UpDownCounter U0 (
        .reset(reset),
        .clk(clk),
        .UpDown(UpDown),
        .cnt_out(cnt_out)
    );

    initial begin
        // 초기 신호 값 설정
        reset = 1; UpDown = 1; // UP 동작 설정
        #450 reset = 0; // 리셋 활성화
        #500 reset = 1; // 리셋 비활성화
        #100 UpDown = 0; // DOWN 동작으로 변경
        #1500 UpDown = 1; // 다시 UP 동작으로
		  #1500 UpDown = 0; // DOWN 동작으로 변경
		  #1500 UpDown = 1; // 다시 UP 동작으로
    end

    initial begin
        clk = 0;
        forever #100 clk = ~clk; // 10ns 간격의 클럭 생성
    end
endmodule

