module ProfessorUpDownCounter(reset, stepClk, UpDown, cnt_out);
	input		reset, stepClk, UpDown;
	output reg [1:0] cnt_out;
	
	parameter		S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
	
	reg [1:0] state=S0, next_state;
	
	always @(posedge stepClk)
		if (~reset) state <= S0;
			else state <= next_state;
		
	
	always @(UpDown, state)
		case(state)
			S0: if(~UpDown) next_state <= S1;
					else		 next_state <= S3;
			S1: if(~UpDown) next_state <= S2;
					else		 next_state <= S0;
			S2: if(~UpDown) next_state <= S3;
					else  	 next_state <= S1;
			S3: if(~UpDown) next_state <= S0;
					else		 next_state <= S2;
		endcase
		
	always @(state)			// assign cont_out = state;
		if(state == S0) cnt_out = 2'b00;
		else if(state == S1) cnt_out = 2'b01;
		else if(state == S1) cnt_out = 2'b10;
		else cnt_out = 2'b11;
endmodule