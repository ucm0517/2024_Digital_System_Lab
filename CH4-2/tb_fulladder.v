 `timescale
 module tb_fulladder;
 reg rA, rB, rCin;
 wire oSum, oCout;
 1ns / 100ps
 full_adder U0    (rA, rB, rCin, oSum, oCout);
 initial
 begin
 rA = 0; rB = 0; rCin = 0;
 #100 rCin = 1;
 #100 rB = 1; rCin = 0;
 #100 rCin = 1;
 #100 rA = 1; rB = 0; rCin = 0;
 #100 rCin = 1;
 #100 rB = 1; rCin = 0;
 #100 rCin = 1;
 end
 endmodule
