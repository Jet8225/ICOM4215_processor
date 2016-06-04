module test_mux_2x1_32b; 
	wire [31:0] Y;

	reg [31:0] X0, X1;

	reg Sel;

	parameter sim_time = 100;

	mux_2x1_32b m1(Y, Sel, X0, X1);
	
	initial #sim_time $finish;

	initial begin
		X0 = 32'h00000000;
		X1 = 32'h00000001;
		Sel  = 0;

		#10 X0 = 32'h00000030;
		#10 Sel = 1;

		#10 X1 = 32'h00100000;
	end

	initial begin
		$display("Sel Y               X0         	      X1");
		$monitor("%b   %h        %h         %h", Sel, Y, X0, X1);
	end
endmodule