`timescale 1ns/100ps

module tb_frq_div;
    reg rRst, rMclk;
    wire wDivClk;
    wire wClk_out;

    FrqDiv_100 U0 (rMclk, rRst, wClk_out, wDivClk);

    initial begin
        rMclk = 0;
        rRst = 0;
        #150 rRst = 1;
    end

    always
        #100 rMclk = ~rMclk;
endmodule