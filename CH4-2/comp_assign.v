module comp_assign(iA, iB, AgtB, AltB, AeqB);
input [3:0] iA, iB;
output AgtB, AltB, AeqB;
assign AltB= (iA < iB);
assign AgtB= (iA > iB);
assign AeqB= (iA == iB);
endmodule