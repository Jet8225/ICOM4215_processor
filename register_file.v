module register_file(output [31:0] A, B, input [31:0] C, input [3:0] ra, rb, rc, input clk, clr, le);
	
	//wires for register outpus
	wire [31:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out;

	// wires for decoder output
	wire [15:0] decOut;

	// wire for or gate outputs
	wire wor0, wor1, wor2, wor3, wor4, wor5, wor6, wor7, wor8, wor9, wor10, wor11, wor12, wor13, wor14, wor15;

	// decoder
	decoder_4x16_neg decoder(decOut,rc);

	// Or gates that connect to the decoder into the register enable
	or(wor0,decOut[0],le);
	or(wor1,decOut[1],le);
	or(wor2,decOut[2],le);
	or(wor3,decOut[3],le);
	or(wor4,decOut[4],le);
	or(wor5,decOut[5],le);
	or(wor6,decOut[6],le);
	or(wor7,decOut[7],le);
	or(wor8,decOut[8],le);
	or(wor9,decOut[9],le);
	or(wor10,decOut[10],le);
	or(wor11,decOut[11],le);
	or(wor12,decOut[12],le);
	or(wor13,decOut[13],le);
	or(wor14,decOut[14],le);
	or(wor15,decOut[15],le);

	// registers within the register file 0-15
	register_32b r0(r0_out, wor0, clk, clr, C);
	register_32b r1(r1_out, wor1, clk, clr, C);
	register_32b r2(r2_out, wor2, clk, clr, C);
	register_32b r3(r3_out, wor3, clk, clr, C);
	register_32b r4(r4_out, wor4, clk, clr, C);
	register_32b r5(r5_out, wor5, clk, clr, C);
	register_32b r6(r6_out, wor6, clk, clr, C);
	register_32b r7(r7_out, wor7, clk, clr, C);
	register_32b r8(r8_out, wor8, clk, clr, C);
	register_32b r9(r9_out, wor9, clk, clr, C);
	register_32b r10(r10_out, wor10, clk, clr, C);
	register_32b r11(r11_out, wor11, clk, clr, C);
	register_32b r12(r12_out, wor12, clk, clr, C);
	register_32b r13(r13_out, wor13, clk, clr, C);
	register_32b r14(r14_out, wor14, clk, clr, C);
	register_32b r15(r15_out, wor15, clk, clr, C);


	// mutiplexers at the output 
	mux_16x1_32b mA(A,ra,r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out);
	mux_16x1_32b mB(B,rb,r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out);

endmodule