module D_7SEG (
		input 			CLK,				// 1kHz
		input	[31:0]	DIN,
		output reg [7:0]	SEG_COM, 	// 7-SEGMENT COMMON SELECT 
		output reg [7:0]	SEG_DATA 	// 7-SEGMENT DATA 
		);

	reg	[2:0]	CNT_SCAN = 0;			// SCAN COUNT 

	function [7:0]	dec_7_seg;
		input	[3:0]	val;
		reg [7:0]	res;

		begin
			if			(val == 4'h0)  res = 8'b00111111;	//8'h3F"			-- '0' : OFF
			else if	(val == 4'h1)  res = 8'b00000110;	//8'h06"			-- '1' : ON
			else if	(val == 4'h2)  res = 8'b01011011;	//8'h5B"			-- MSB : Segment 'h
			else if	(val == 4'h3)  res = 8'b01001111;	//8'h4F"			-- LSB : Segment 'a'
			else if	(val == 4'h4)  res = 8'b01100110;	//8'h66"
			else if	(val == 4'h5)  res = 8'b01101101;	//8'h6D"
			else if	(val == 4'h6)  res = 8'b01111101;	//8'h7D"
			else if	(val == 4'h7)  res = 8'b00000111;	//8'h07"
			else if	(val == 4'h8)  res = 8'b01111111;	//8'h7F"
			else if	(val == 4'h9)  res = 8'b01101111;	//8'h6F"
			else if	(val == 4'hA)  res = 8'b01110111;	//8'h77"
			else if	(val == 4'hB)  res = 8'b01111100;	//8'h7C"
			else if	(val == 4'hC)  res = 8'b00111001;	//8'h39"
			else if	(val == 4'hD)  res = 8'b01011110;	//8'h5E"
			else if	(val == 4'hE)  res = 8'b01111001;	//8'h79"
			else if	(val == 4'hF)  res = 8'b01110001;	//8'h71"
			else		 res = 8'b01000000;
			
			dec_7_seg = res;
		end
	endfunction
	

	always	@(posedge CLK) 
	begin
		if (CLK == 1) begin
			if (CNT_SCAN == 7)  
				CNT_SCAN <= 0; 
			else
				CNT_SCAN <= (CNT_SCAN + 1);
		end
	end

	always	@(CNT_SCAN, DIN)
	begin
		case (CNT_SCAN) 
			3'd0 : begin
					SEG_DATA = dec_7_seg( DIN[3:0] );
					SEG_COM = 8'b11111110;						// SEL COM1
				end
			3'd1 : begin
					SEG_DATA = dec_7_seg( DIN[7:4] );
					SEG_COM = 8'b11111101;						// SEL COM2 
				end
			3'd2 : begin
					SEG_DATA = dec_7_seg( DIN[11:8] );
					SEG_COM = 8'b11111011;						// SEL COM3 
				end
			3'd3 : begin
					SEG_DATA = dec_7_seg( DIN[15:12] );
					SEG_COM = 8'b11110111;						// SEL COM4
				end
			3'd4 : begin
					SEG_DATA = dec_7_seg( DIN[19:16] );
					SEG_COM = 8'b11101111;						// SEL COM5
				end
			3'd5 : begin
					SEG_DATA = dec_7_seg( DIN[23:20] );
					SEG_COM = 8'b11011111;						// SEL COM6 
				end
			3'd6 : begin
					SEG_DATA = dec_7_seg( DIN[27:24] );
					SEG_COM = 8'b10111111;						// SEL COM7 
				end
			3'd7 : begin
					SEG_DATA = dec_7_seg( DIN[31:28] );
					SEG_COM = 8'b01111111;						// SEL COM8
				end
			default : begin
					SEG_DATA = 8'h00;							// 
					SEG_COM = 8'b11111111;						// SEL X 
				end
		endcase 
	end 
endmodule