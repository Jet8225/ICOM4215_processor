module mux_16x1_32b(output reg [31:0] Y, input [3:0] Sel, input [31:0] X0, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15); 
	always @(Sel, X0, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15)
		case(Sel)
			4'b0000:	Y = X0;
			4'b0001:	Y = X1;
			4'b0010:	Y = X2;
			4'b0011:	Y = X3;
			4'b0100:	Y = X4;
			4'b0101: 	Y = X5;
			4'b0110:	Y = X6;
			4'b0111:	Y = X7;
			4'b1000:	Y = X8;
			4'b1001:	Y = X9;
			4'b1010:	Y = X10;
			4'b1011:	Y = X11;
			4'b1100:	Y = X12;
			4'b1101:	Y = X13;
			4'b1110:	Y = X14;
			4'b1111:	Y = X15;
		endcase
endmodule
