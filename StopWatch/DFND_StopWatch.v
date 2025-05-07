module DFND_StopWatch (
    input clk1k,           // 1kHz Clock
    input sw_reset,        // Reset signal
    input sw_strtstop,     // Start/Stop signal
    output [7:0] seg_com,  // 7-segment common control signal
    output [7:0] seg_data  // 7-segment data signal
);

    wire [31:0] val; // Internal wire for passing display value from StopWatch to D_7SEG

/*
    // Instantiate D_7SEG module
    D_7SEG u1 (
        .CLK(clk1k),
        .DIN(val),         // Input connected to val from StopWatch
        .SEG_COM(seg_com), // 7-segment common control
        .SEG_DATA(seg_data) // 7-segment data
    );
    // Instantiate StopWatch module
    StopWatch u2 (
        .clk1k(clk1k),
        .sw_reset(sw_reset),
        .sw_strtstop(sw_strtstop),
        .disp_val(val) // Output connected to val
    );
	 
	 
*/
	D_7SEG seg (clk1k, val, seg_com, seg_data);
	StopWatch swt (clk1k, sw_reset, sw_strtstop, val);
endmodule
