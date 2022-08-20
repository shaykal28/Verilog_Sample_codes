module PriEncoder_3X8(input [7:0] D,
		      input V,
                      output [2:0] Y);

wire    D7_not, D6_not, D5_not, D4_not, D2_not;
 wire    wa0, wa1, wa2, wa3, wa4;

  //instanitate gates
  not    g0 (D7_not, D[7]),
         g1 (D6_not, D[6]),
         g2 (D5_not, D[5]),
         g3 (D4_not, D[4]),
         g4 (D2_not, D[2]);
  and    g5 (wa0, D6_not, D4_not, D[3]),
         g6 (wa1, D5_not, D4_not, D[3]),
         g7 (wa2, D5_not, D4_not, D[2]),
         g8 (wa3, D6_not, D[5]),
         g9 (wa4, D6_not, D4_not, D2_not, D[1]);
  or     g11(Y[2], D[7], D[6], D[5], D[4]),
         g12(Y[1], D[7], D[6], wa1, wa2),
         g13(Y[0], D[7], wa0, wa3, wa4),
         g14(V, D[0], D[1], D[2], D[3], D[4], D[5], D[6], D[7]);

endmodule 

