`timescale 1ns/100ps

module tb_ClockDivider;

    reg clk_in;
    reg rst;
    wire clk_out;

    // DUT 인스턴스화
    ClockDivider UUT (
        .iClk_in(clk_in),
        .iRst(rst),
        .oClk_out(clk_out)
    );

    // 클럭 생성 (1MHz = 1us 주기)
    initial begin
        clk_in = 0;
        forever #0.5 clk_in = ~clk_in; // 1MHz 클럭 생성
    end

    // 리셋 및 테스트 시나리오
    initial begin
        rst = 0;              // 리셋
        #10 rst = 1;          // 리셋 해제
        #10_000_000 $finish;  // 시뮬레이션 종료 (10초 동안 실행)
    end

    // 출력 모니터링
    initial begin
        $monitor("Time: %0dns, clk_out: %b", $time, clk_out);
    end

endmodule