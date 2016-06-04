module register_32b(output reg [31:0] Q, input LE, Clk, Clr, input [31:0] D);
	always @(posedge Clk, negedge Clr)
		if(!Clr) Q <= 32'h00000000;
		else if(!LE) Q <= D;
endmodule