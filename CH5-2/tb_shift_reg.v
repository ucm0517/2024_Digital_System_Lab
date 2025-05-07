`timescale 1ns/100ps

module tb_shift_reg;
    reg clk, nRst, sIn;
    wire sOut;

    siso U0 (clk, nRst, sIn, sOut);

    initial begin
        clk = 1'b0;
        forever #100 clk = ~clk;
    end

    initial begin
        sIn = 0; nRst = 0;
        #200 nRst = 1;
        forever begin
            #200 sIn = 1;  #200 sIn = 0;
            #400 sIn = 1;  #600 sIn = 0;
            #200 sIn = 1;  #200 sIn = 0;
            #400 sIn = 1;  #200 sIn = 0;
            #400 sIn = 1;  #400 sIn = 0;
        end
    end
endmodule