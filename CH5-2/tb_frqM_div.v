`timescale 1ns/100ps

module tb_frqM_div;
    reg rRst, rMclk;
    wire wDivClk;
    wire wClk_out;

    FrqDiv_1M U0 (rMclk, rRst, wClk_out, wDivClk);

    initial begin
        rMclk = 0;
        rRst = 0;
        #15 rRst = 1;
    end

    always
        #100 rMclk = ~rMclk;
endmodule