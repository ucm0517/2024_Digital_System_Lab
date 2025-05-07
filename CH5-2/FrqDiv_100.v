module FrqDiv_100 (iClk_in, iRst, oClk_out, oDivClk);
    input iRst, iClk_in;
    output oDivClk, oClk_out;

    reg [5:0] cnt;
    reg oDivClk;

    assign oClk_out = iClk_in;

    always @(posedge iClk_in or negedge iRst) begin
        if (!iRst) begin
            cnt <= 0;
            oDivClk <= 0;
        end else begin
            if (cnt == 49) begin
                cnt <= 0;
                oDivClk <= ~oDivClk;
            end else
                cnt <= cnt + 1;
        end
    end
endmodule