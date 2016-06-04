module mux_2x1_32b(output reg [31:0] Y, input Sel, input [31:0] X0, X1);
	always @(Sel, X0, X1)
		if(Sel) Y = X1;
		else Y = X0;
endmodule
