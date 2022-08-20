module decoder_2X4(input  a0,a1,en,
         	       output y0,y1,y2,y3);
assign y0 = (~a0 & ~a1) & en;
assign y1 = (a0 & ~a1) & en;
assign y2 = (~a0 & a1) & en;
assign y3 = (a0 & a1) & en;

endmodule

