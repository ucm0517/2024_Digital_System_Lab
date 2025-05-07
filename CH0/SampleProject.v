module SampleProject ( input clk, reset, output reg out_clk5 );
	reg [2:0]	cnt;

	always @(posedge clk, negedge reset)
		if( reset == 0 )
			begin
				cnt <= 0;
				out_clk5 <= 0 ;
			end
		else
				if( cnt == 4 )
					begin
						cnt <= 0;
						out_clk5 <= ~out_clk5;
					end
				else
					cnt <= cnt + 1;
endmodule

`timescale		1ns / 100ps
module tb_SampleProject;
    reg rClk, rRst;
 
    SampleProject U0 (rClk, rRst, wOut); 

    initial
        rClk = 0;
        always #10 rClk = ~rClk; //

    initial
    begin
        rRst = 1;
        #5 rRst = 0;
        #10 rRst = 1;
    end
endmodule