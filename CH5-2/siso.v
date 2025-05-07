module siso(clk, iRst, sIn, sOut);
    input clk, iRst, sIn;
    output sOut;

    reg [3:0] q;

    assign sOut = q[3];

    always @(posedge clk) begin
        if (!iRst)
            q <= 0;
        else begin
            q[0] <= sIn;       // q[0] = sIn;
            q[3:1] <= q[2:0];  // q[3:1] = q[2:0];
        end
    end
endmodule