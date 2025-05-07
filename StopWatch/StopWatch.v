//
//	For Simulation pls. START/STOP and RESET SW signal should be more then 100 ns
//
//	Display on FND ARRAY
//
module StopWatch ( input clk1k, sw_reset, sw_strtstop, output reg [31:0] disp_val );			// Display value
		
	reg	[9:0]		cnt1k;
	reg				en_cnt_sec;
	reg				strtstop;
	reg	[6:0]		sec, min;


	always	@(posedge sw_strtstop, negedge sw_reset)
	begin
		if( sw_reset == 0 )													// If sw_reset, Stop watch
			strtstop <= 0;														//
		else if ( sw_strtstop == 1)										// If sw_strtstop, toggle signal strtstop
			strtstop <= !strtstop;										//
	end

	always	@(negedge sw_reset, posedge clk1k)
	begin
		if( sw_reset == 0 ) begin													// If sw_reset, Clear counter sec
			cnt1k <= 0;
			en_cnt_sec <= 0;
		end
		else if( strtstop==1 )
			if( cnt1k == 999 ) begin 											// If not, skip count.
					cnt1k <= 0;
					en_cnt_sec <= 1;												// enable sec cnt
				end
			else begin
				cnt1k <= cnt1k + 1;
				en_cnt_sec <= 0;
			end
	end

	always	@(negedge sw_reset, posedge en_cnt_sec)
	begin
		if( sw_reset == 0 ) 													// If sw_reset, Clear counter sec
			sec <= 0;
		else	if( sec < 59 )  //else if( sec ==59) sec <= 0
					sec <= sec + 1;
				else
					sec <= 0;
	end

	always	@(negedge sw_reset, posedge en_cnt_sec)						// If sw_reset, Clear counter min
	begin
		if( sw_reset == 0 )
			min <= 0;
		else	if( sec == 59 ) 													// If sec counter is 59,
					if( min < 59 )													// Count minute
						min <= min + 1;
						else
							min <= 0;
	end

	always	@(sec, min)
	begin
			disp_val[3 : 0]   = sec % 10;
			disp_val[7 : 4]   = sec / 10;
			disp_val[11 : 8]  = min % 10;
			disp_val[15 : 12] = min / 10;
	end

endmodule
