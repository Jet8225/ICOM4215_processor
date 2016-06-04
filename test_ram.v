module test_ram;
	reg enable, readWrite;
	reg [1:0] dataType;

	reg [31:0] dataIn;

	reg [7:0] address;

	wire [31:0] dataOut;
	wire done;

	parameter sim_time = 200;

	ram_256x8 ram(dataOut, done, dataIn, address, dataType, readWrite, enable);

	initial #sim_time $finish;

	initial begin
		enable = 1'b0;
		readWrite = 1'b1;
		dataType = 2'b00;
		address = 8'h00;
		dataIn = 32'h0000000F;

		fork
			#5 enable = 1'b1;
			#15 enable = 1'b0;
			#16 address = 8'h01;
			#16 dataIn = 32'h000000F0;
			#17 enable = 1'b1;
			#27 readWrite = 1'b0;
			#37 address = 8'h00;
			#48 address = 8'h01;
			#59 dataType = 2'b01;
			#60 address = 8'h00;
			#71 enable = 1'b0;
			#71 readWrite = 1'b1;
			#72 address = 8'h02;
			#72 dataIn = 32'h00001010;
			#73 enable = 1'b1;
			#85 readWrite = 1'b0;
			#96 dataType = 2'b10;
			#97 address = 8'h00;
			#108 enable = 0;
			#109 address = 8'h04;
			#110 dataIn = 32'h0f02090a;
			#110 readWrite = 1'b1;
			#111 enable = 1;
			#122 readWrite = 1'b0;



		join
	end

	initial begin
		$display(" en  rw  datatype  address  dataIn         dataOut             done");
		$monitor(" %b   %b   %b        %h       %h       %h            %b",enable,readWrite,dataType,address,dataIn,dataOut,done, $time);
	end
endmodule