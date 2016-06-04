module ram_256x8(output reg [31:0] dataOut, output reg done, input [31:0] dataIn, input [7:0] address, input [1:0] dataType, input rw, enable);
	
	reg [7:0] mem[0:255];

	always @(enable, address)
		if(enable)
			if (rw) // rw = 1 thus it's writing
				case(dataType)
					2'b00:	
						begin
							done = 0;
							#10 mem[address] = dataIn[7:0]; // byte
							done = 1;
						end
					2'b01: 	// half-word
						begin
							done = 0;
							#10 mem[address] = dataIn[15:8];
							mem[address +1] = dataIn[7:0];
							done = 1;
						end
					2'b10:	// word
						begin
							done = 0;
							#10 mem[address] = dataIn[31:24];
							mem[address+1] = dataIn[23:16];
							mem[address+2] = dataIn[15:8];
							mem[address+3] = dataIn[7:0];
							done = 1;
						end
				endcase
			else begin // for reading
				case(dataType)
					2'b00: // byte
						begin
							done = 0;
							#10 dataOut = {24'b0,mem[address]};
							done = 1;
						end
					2'b01: // half-word
						begin
							done = 0;
							#10 dataOut = {16'b0,mem[address],mem[address+1]};
							done = 1;
						end
					2'b10: // word
						begin
							done = 0;
							#10 dataOut = {mem[address],mem[address+1],mem[address+2],mem[address+3]};
							done = 1;
						end
				endcase
			end

		else dataOut = 32'bz;
endmodule
