module p_enc42_if (iA, oY);
    input [3:0] iA;
	 
    output [1:0] oY;
    reg [1:0] oY;

    always @(iA) begin
        if (iA[3])          
            oY = 2'b11;
        else if (iA[2])      
            oY = 2'b10;
        else if (iA[1])      
            oY = 2'b01;
        else if (iA[0])       
            oY = 2'b00;
        else
            oY = 2'bx;        
    end
endmodule