`timescale
1ns / 100ps
module tb_comp;
reg [3:0] rA, rB;
wire wAgtB, wAltB, wAeqB;
comp_if U0 (rA, rB, wAgtB, wAltB, wAeqB);
//comp_assign U0 (rA, rB, wAgtB, wAltB, wAeqB);
always
begin
rA = 4'b0000; rB = 4'b0000;
#200 rA = 4'b0010; rB = 4'b0000;
#200 rA = 4'b1100; rB = 4'b1101;
#200 rA = 4'b1001; rB = 4'b1001;
#200 rA = 4'b0111; rB = 4'b0100;  
#200 rA = 4'b1110; rB = 4'b1111;
#200 rA = 4'b1101; rB = 4'b1001;
#200 rA = 4'b1010; rB = 4'b1010;
#200;
end
endmodule
