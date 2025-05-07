module mux41_if (iSel, iA, iB, iC, iD, oY);
    input [1:0] iSel;
    input [3:0] iA, iB, iC, iD;
    output [3:0] oY;
    reg [3:0] oY;

    always @(iSel or iA or iB or iC or iD)
    begin
        if (iSel == 2'b00) oY = iA;
        else if (iSel == 2'b01) oY = iB;
        else if (iSel == 2'b10) oY = iC;
        else if (iSel == 2'b11) oY = iD;
        else oY = 4'bx;
    end
endmodule