`timescale 1us / 100ns

module tb_DFND_StopWatch;
    reg rclk1k, rsw_reset, rsw_strtstop;
    wire [7:0] wseg_com, wseg_data;

    DFND_StopWatch u0 (rclk1k, rsw_reset, rsw_strtstop, wseg_com, wseg_data);

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
