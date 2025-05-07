module comp_if(iA, iB, AgtB, AltB, AeqB);
input [3:0] iA, iB;
output AgtB, AltB, AeqB;
reg AgtB, AltB, AeqB;
always @(iA or iB)
begin
AltB= 1'b0;
AgtB= 1'b0;
AeqB= 1'b0;
if (iA == iB) AeqB= 1'b1;
else if (iA > iB) AgtB= 1'b1;
else AltB= 1'b1;
end
endmodule