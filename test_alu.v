module test_alu;
	wire [31:0] y;
	wire zout, cout, nout, vout;

	reg [31:0] a, b;
	reg [3:0] opcode;
	reg zin, cin, nin, vin;

	parameter sim_time = 100;

	alu alu1(y, vout,zout,nout,cout,a,b,opcode,vin,zin,nin,cin);

	initial #sim_time $finish;

	initial begin
		a = 32'h00000005;
		b = 32'h00000003;
		zin = 0;
		cin = 1;
		nin = 0;
		vin = 0;
		opcode = 4'b0000;

		repeat(15) #5 opcode = opcode + 4'b0001;

	end

	initial begin
		$display(" opcode    zout nout cout vout    y");
		$monitor(" %b        %b    %b  %b    %b      %h", opcode, zout, nout, cout, vout, y, $time);
	end
endmodule