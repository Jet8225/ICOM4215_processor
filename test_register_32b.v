module test_register_32b;
	wire [31:0] Y;
	reg [31:0] X;
	reg clk, clr, le;

	parameter sim_time = 100;

	register_32b r0(Y,le,clk,clr,X);

	initial #sim_time $finish;

	initial begin 
		clk = 1'b0;
		repeat (20) #5 clk = ~clk;
	end

	initial begin
		X = 32'h00000001;
		clr = 1;
		le = 1;

		fork
			#3 le = 0;
			#6 le = 1;
			#8 X = 32'h000000A0;
			#23 le = 0;
			#26 le = 1;

			#31 clr = 0;

			#32 clr = 1;
		join
	end
	
	

	initial begin
		$display("Clk  Clr  LE    X             Y");
		$monitor("%b    %b    %b     %h      %h", clk, clr, le, X, Y, $time);
	end
endmodule



