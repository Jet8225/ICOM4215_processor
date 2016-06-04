module test_registerFile;
	wire [31:0] A, B;

	reg [31:0] C;

	reg [3:0] ra, rb, rc;

	reg clk, clr, le;

	parameter sim_time = 300;

	register_file rFile(A, B, C, ra, rb, rc, clk, clr, le);

	initial #sim_time $finish;

	initial begin
		clk = 1'b0;
		clr = 1'b1;
		le  = 1'b1;
		
		ra = 4'h0;
		rb = 4'h1;
		rc = 4'h0;

		C = 32'h00000000;

		forever #5 clk = ~clk;
	end
	
	initial begin
		fork
			#3 le = 0;
			#6 le = 1;
			#7 rc = rc + 4'h1;
			#8 C = C + 32'h00000001;
			#13 le = 0;
			#16 le = 1;
			#17 rc = rc + 4'h1;
			#18 C = C + 32'h00000001;
			#23 le = 0;
			#26 le = 1;
			#27 rc = rc + 4'h1;
			#28 C = C + 32'h00000001;
			#33 le = 0;
			#36 le = 1;
			#37 rc = rc + 4'h1;
			#38 C = C + 32'h00000001;
			#43 le = 0;
			#46 le = 1;
			#47 rc = rc + 4'h1;
			#48 C = C + 32'h00000001;
			#53 le = 0;
			#56 le = 1;
			#57 rc = rc + 4'h1;
			#58 C = C + 32'h00000001;
			#63 le = 0;
			#66 le = 1;
			#67 rc = rc + 4'h1;
			#68 C = C + 32'h00000001;
			#73 le = 0;
			#76 le = 1;
			#77 rc = rc + 4'h1;
			#78 C = C + 32'h00000001;
			#83 le = 0;
			#86 le = 1;
			#87 rc = rc + 4'h1;
			#88 C = C + 32'h00000001;
			#93 le = 0;
			#96 le = 1;
			#97 rc = rc + 4'h1;
			#98 C = C + 32'h00000001;
			#103 le = 0;
			#106 le = 1;
			#107 rc = rc + 4'h1;
			#108 C = C + 32'h00000001;
			#113 le = 0;
			#116 le = 1;
			#117 rc = rc + 4'h1;
			#118 C = C + 32'h00000001;
			#123 le = 0;
			#126 le = 1;
			#127 rc = rc + 4'h1;
			#128 C = C + 32'h00000001;
			#133 le = 0;
			#136 le = 1;
			#137 rc = rc + 4'h1;
			#138 C = C + 32'h00000001;
			#143 le = 0;
			#146 le = 1;
			#147 rc = rc + 4'h1;
			#148 C = C + 32'h00000001;
			#153 le = 0;
			#156 le = 1;
			#157 rc = rc + 4'h1;
			#158 C = C + 32'h00000001;			

			#170 clr = 0;
			#177 clr = 1;
		join
	end

	initial begin
		repeat (15) begin
			#15 ra = ra + 4'h1;
			rb = rb + 4'h1;
		end
	end
	
	initial begin
		$display("clk  clr  le   ra   rb   rc   A              B");
		$monitor("%b    %b    %b    %h    %h    %h    %h       %h",clk, clr, le, ra, rb, rc, A, B, $time);
	end

endmodule
