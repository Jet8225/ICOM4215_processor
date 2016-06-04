module alu(output reg [31:0] Y, output reg vout, zout, nout, cout, input [31:0] a, b, input [3:0] opcode, input vin, zin, nin, cin);
	
	always @(a,b,opcode)
		case(opcode)
			4'b0000:
				begin
					Y = a & b;
					nout = Y[31];
					cout = cin;
					if (Y == 32'b0) zout = 1;
					else zout = 0;
				end
			4'b0001:
				begin
					Y = a ^ b;
					nout = Y[31];
					cout = cin;
					if (Y == 32'b0) zout =1;
					else zout = 0;
				end
			4'b0010:
				begin
					Y = a -b;
					nout = Y[31];
					if (Y==32'b0) zout = 1;
					else zout = 0;
				end
			4'b0011:
				begin
					Y = b - a;
					nout = Y[31];
					if (Y ==32'b0) zout = 1;
					else zout = 0;
				end
			4'b0100:
				begin
					Y = a+b;
					nout = Y[31];
					if (Y==32'b0) zout = 1;
					else zout = 0;
					if (a[31]==1 && b[31]==1) cout = 1;
					else cout = 0;
					if (a[31]==1 && b[31]==1) vout = 1;
					else vout = 0;
				end
			4'b0101:
				begin
					Y = a + b + cin;
					nout = Y[31];
					if (Y==32'b0) zout = 1;
					else zout = 0;
				end
			4'b0110:
				begin
					Y = a - b - ~cin;
					if (Y==32'b0) zout = 1;
					else zout = 0;
				end
			4'b0111:
				begin
					Y = b -a - ~cin;
					nout = Y[31];
					if (Y==32'b0) zout = 1;
					else zout = 0;
				end
			4'b1000:
				begin
					Y = a & b;
					nout = Y[31];
					if (Y==32'b0) zout = 1;
					else zout = 0;
					cout = cin;
				end
			4'b1001:
				begin
					Y = a ^ b;
					nout = Y[31];
					cout = cin;
					if (Y == 32'b0) zout =1;
					else zout = 0;
				end
			4'b1010:
				begin
					Y = a -b;
					nout = Y[31];
					if (Y==32'b0) zout = 1;
					else zout = 0;
				end
			4'b1011:
				begin
					Y = a+b;
					nout = Y[31];
					if (Y==32'b0) zout = 1;
					else zout = 0;
					if (a[31]==1 && b[31]==1) cout = 1;
					else cout = 0;
					if (a[31]==1 && b[31]==1) vout = 1;
					else vout = 0;
				end
			4'b1100:
				begin
					Y = a | b;
					nout = Y[31];
					cout = cin;
					if (Y == 32'b0) zout = 1;
					else zout = 0;
				end
			4'b1101:
				begin 
					Y = b;
					nout = Y[31];
					cout = cin;
					if (Y == 32'b0) zout = 1;
					else zout = 0;
				end
			4'b1110:
				begin
					Y = a & !b;
					nout = Y[31];
					cout = cin;
					if (Y == 32'b0) zout = 1;
					else zout = 0;
				end
			4'b1111:
				begin
					Y = !b;
					nout = Y[31];
					cout = cin;
					if (Y == 32'b0) zout = 1;
					else zout = 0;
				end
		endcase
endmodule