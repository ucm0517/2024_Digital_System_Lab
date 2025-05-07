 `timescale
 1ns / 100ps
 module tb_segment;
 reg [3:0]    rBCD_data;
 wire [6:0]   wSEG_data;
 integer i;
 bcd2seg U0 (.bcd_data(rBCD_data),.seg_data(wSEG_data));
 initial
 begin
 rBCD_data = 0;
 for(i=0; i<=9; i=i+1)
 #200 rBCD_data = rBCD_data + 1;
 $stop;
 end
 endmodule
