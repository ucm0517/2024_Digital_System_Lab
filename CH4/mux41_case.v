module mux41_case (iSel, iA, iB, iC, iD, oY);
    input [1:0] iSel;
    input [3:0] iA, iB, iC, iD;
    output [3:0] oY;
    reg [3:0] oY;

    always @(iSel or iA or iB or iC or iD)
    begin
        case (iSel)
            2'b00: oY = iA;
            2'b01: oY = iB;
            2'b10: oY = iC;
            2'b11: oY = iD;
            default: oY = 4'bx;
        endcase
    end
endmodule