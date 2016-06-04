module imm_shifter(output reg [31:0] Y, output c_out, input [11:0] shifter_operand, input c_in);
	wire [3:0] rotate_imm = shifter_operand[11:8];
	wire [7:0] immed_8 = shifter_operand[7:0];

	