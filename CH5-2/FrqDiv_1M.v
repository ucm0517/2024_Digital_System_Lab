module FrqDiv_1M (iClk_in, iRst, oClk_out, oDivClk);
    input iRst, iClk_in;
    output oDivClk, oClk_out;

    reg [19:0] cnt;
    reg oDivClk;

    assign oClk_out = iClk_in;

    always @(posedge iClk_in or negedge iRst) begin
        if (!iRst) begin
            cnt <= 0;
            oDivClk <= 0;
        end else begin
            if (cnt == 499999) begin
                cnt <= 0;
                oDivClk <= ~oDivClk;
            end else
                cnt <= cnt + 1;
        end
    end
endmodule