module ClockDivider (
    input wire iClk_in,    // 1MHz 입력 클럭
    input wire iRst,       // 리셋 신호
    output reg oClk_out    // 1Hz 출력 클럭
);

    reg [19:0] counter;    // 20비트 카운터 (최대값: 1,048,575)

    always @(posedge iClk_in or negedge iRst) begin
        if (!iRst) begin
            counter <= 0;
            oClk_out <= 0;
        end else begin
            if (counter == 999_999) begin
                counter <= 0;
                oClk_out <= ~oClk_out;  // 출력 클럭 반전
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule