module hex2seg(hex_data, seg_data);
    input [3:0] hex_data;       // 4-bit 16진수 입력
    output reg [6:0] seg_data;  // 7-Segment 출력

    always @(hex_data)
    begin
        case (hex_data)
            4'h0 : seg_data = 7'b1111110;  // 0
            4'h1 : seg_data = 7'b0110000;  // 1
            4'h2 : seg_data = 7'b1101101;  // 2
            4'h3 : seg_data = 7'b1111001;  // 3
            4'h4 : seg_data = 7'b0110011;  // 4
            4'h5 : seg_data = 7'b1011011;  // 5
            4'h6 : seg_data = 7'b1011111;  // 6
            4'h7 : seg_data = 7'b1110000;  // 7
            4'h8 : seg_data = 7'b1111111;  // 8
            4'h9 : seg_data = 7'b1111011;  // 9
            4'hA : seg_data = 7'b1110111;  // A
            4'hB : seg_data = 7'b0011111;  // B
            4'hC : seg_data = 7'b1001110;  // C
            4'hD : seg_data = 7'b0111101;  // D
            4'hE : seg_data = 7'b1001111;  // E
            4'hF : seg_data = 7'b1000111;  // F
            default : seg_data = 7'b0000000;  // 기본 값 (꺼짐)
        endcase
    end
endmodule