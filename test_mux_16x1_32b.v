module test_mux_16x1_32b;
	wire [31:0] Y;
	reg [31:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15;

	reg [3:0] sel;

	parameter sim_time = 500;

	mux_16x1_32b m1( Y, sel, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15);

	initial #sim_time $finish;

	initial begin
		sel = 4'h0;
		
		x0 = 32'h00000000;
		x1 = 32'h00000001;
		x2 = 32'h00000002;
		x3 = 32'h00000003;
		x4 = 32'h00000004;
		x5 = 32'h00000005;
		x6 = 32'h00000006;
		x7 = 32'h00000007;
		x8 = 32'h00000008;
		x9 = 32'h00000009;
		x10 = 32'h0000000A;
		x11 = 32'h0000000B;
		x12 = 32'h0000000C;
		x13 = 32'h0000000D;
		x14 = 32'h0000000E;
		x15 = 32'h0000000F;

		repeat(15) #10 sel = sel + 4'h1;

		#10 x0 = 32'h00010000;
		#10 x15 = 32'h000000A0;
		#10 x7 = 32'h00000070;

		#10 sel = 4'h0;
		#10 sel = 4'hF;
		#10 sel = 4'h7;
	end

	initial begin
		$display("Sel  Y");
		$monitor("%h    %h", sel, Y, $time);
	end
endmodule