module full_adder(iA, iB, iCin, oSum, oCout);
input      iA, iB, iCin;
output   Sum, oCout;
wire wSum, C1, C2;
half_adderU0 (iA, iB, wSum, C1);
half_adderU1 (wSum, iCin, oSum, C2);
or U2 (oCout, C1, C2);
endmodule

module full_adder(iA, iB, iCin, oSum, oCout);
input                iA, iB, iCin;
output reg       oSum, oCout;
always @(iA, iB, iCin)
begin
{oCout, oSum} = iA + iB+ iCin;
end
endmodule


module full_adder(iA, iB, iCin, oSum, oCout);
input     iA, iB, iCin;
output   oSum, oCout;
wire s1, c1, c2;
assign s1 = iA ^ iB;
assign c1 = iA & iB;
assign c2 = s1 & iCin;
assign oSum= s1 ^ iCin;
assign oCout= c1·c2;
endmodule