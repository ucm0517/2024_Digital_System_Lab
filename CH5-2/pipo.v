module pipo (clk, iRst, load, dIn, dOut);
    input clk, iRst, load;
    input [3:0] dIn;
    output [3:0] dOut;

    reg [3:0] data_reg;

    assign dOut = data_reg;

    always @(posedge clk) begin
        if (!iRst)
            data_reg <= 0;
        else
            if (load)
                data_reg <= dIn;
            else
                data_reg <= data_reg << 1;
    end
endmodule