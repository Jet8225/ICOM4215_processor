module mux_4x1_32b(output reg [31:0] Y, input [1:0] Sel, input [31:0] X0, X1, X2, X3);
	always @(Sel, X0, X1, X2, X3) 
		case(Sel)
			2'b00:	Y = X0;
			2'b01: 	Y = X1;
			2'b10:	Y = X2;
			2'b11: 	Y = X3;
		endcase
endmodule
