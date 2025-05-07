`timescale 1us / 100ns

module tb_StopWatch;
    reg rclk1k, rsw_reset, rsw_strtstop;
    wire [31:0] wval;

    StopWatch u0 (rclk1k, rsw_reset, rsw_strtstop, wval);

    initial begin
        rclk1k = 1'b0;
        forever #500 rclk1k = ~rclk1k;
    end

    initial begin
             rsw_reset = 1'b1; rsw_strtstop = 1'b0;
        #500 rsw_reset = 1'b0; rsw_strtstop = 1'b0;
        #1000 rsw_reset = 1'b1; rsw_strtstop = 1'b0;
        #1000 rsw_reset = 1'b1; rsw_strtstop = 1'b1;
        #1000 rsw_reset = 1'b1; rsw_strtstop = 1'b0;
    end
endmodule
