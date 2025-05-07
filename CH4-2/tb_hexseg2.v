`timescale 1ns / 100ps

module tb_hex2seg;
    reg [3:0] rHEX_data;          // 테스트 벤치 입력 (4-bit 16진수)
    wire [6:0] wSEG_data;         // 7-Segment 출력
	 
	 integer i;
    
    // hex2seg 모듈 인스턴스화
    hex2seg U0 (.hex_data(rHEX_data), .seg_data(wSEG_data));
    

    initial
	 begin
        // 초기 입력 값 설정 및 테스트 시작
        rHEX_data = 4'h0;
        
        // 0부터 F까지 순차적으로 hex_data 값을 증가시키며 출력 확인
        for (i = 0; i < 16; i = i + 1) 
            #200 rHEX_data = rHEX_data + 1; 
        $stop;
    end
endmodule