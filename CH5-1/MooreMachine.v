module MooreMachine(clk, nRst, i, iM, iN, oY);
	input clk, nRst, i, iM, iN;
	output oY;
	reg oY;

	reg state;
	reg next_state;

	parameter S0=1'b0, S1=1'b1;
	always @(posedge clk)
		if (~nRst) state = S0;
		else state = next_state;

		always @(i or state)
			case(state)
				S0:
					if(i) next_state = S1;
					else next_state = S0;
				S1:
					if(i) next_state = S0;
					else next_state = S1;
				endcase

	always @(state or iM or iN)
		case (state)
			S0: oY = iM;
			S1: oY = iN;
	endcase
endmodule