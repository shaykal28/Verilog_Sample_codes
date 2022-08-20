module mux_4(input [3:0] y,
             input  [1:0] sel,
             output out);

wire w1,w2;

mux_2 m1(.i(y[1:0]),.s(sel[0]),.out(w1));
mux_2 m2(.i(y[3:2]),.s(sel[0]),.out(w2));
mux_2 m3(.i({w2,w1}),.s(sel[1]),.out(out));

endmodule








