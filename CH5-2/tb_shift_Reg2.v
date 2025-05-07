`timescale 1ns / 100ps

module tb_shift_reg2;
    reg clk, nRst, load;
    reg [3:0] dIn;
    wire [3:0] dOut;

    pipo U0 (clk, nRst, load, dIn, dOut);

    initial begin
        clk = 0;
        load = 0;
        nRst = 0;
        #200 nRst = 1;
    end

    always 
        #100 clk = ~clk;

    initial begin
        #250 dIn = 15;
        #100 load = 1;
        #200 load = 0;
        #200 dIn = 10;
        #200 dIn = 5;
        #200 dIn = 13;
        #200 dIn = 9;
        #200 dIn = 7;
        #50 load = 1;
        #200 dIn = 14;
        #50 load = 0;
        #200 dIn = 3;
    end
endmodule