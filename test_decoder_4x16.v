module test_decoder_4x16;
	wire [15:0] Y;
	reg [3:0] sel;

	parameter sim_time = 200;

	decoder_4x16_neg d1(Y,sel);

	initial #sim_time $finish;

	initial begin
		sel = 4'h0;
		repeat(15) #10 sel = sel + 4'h1;
	end

	initial begin
		$display("Sel      Y");
		$monitor("%b       %b", sel, Y);
	end
endmodule