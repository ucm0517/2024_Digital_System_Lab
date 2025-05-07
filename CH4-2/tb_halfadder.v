`timescale
module tb_half_adder ;
reg
rA, rB;
half_adder
1ns / 100ps
U0(rA, rB, oSum, oCout);
initial
begin
rA = 0; rB = 0;
#100 rA = 1;
#100 rA = 0; rB = 1;
#100 rA = 1;
#100 rA = 0; rB = 0;
end 
endmodule
