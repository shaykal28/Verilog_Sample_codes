module sr_latch(input S,R,enable,
		output Q,Qb);
wire a,b;

nand n1(a,enable,S);
nand n2(b,enable,R);

nand n3(Q,a,Qb);
nand n4(Qb,b,Q);

endmodule
