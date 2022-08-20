module decoder(input [1:0] a_in, output [3:0] y_out);

assign y_out[0] = ~a_in[1] & ~a_in[0];
assign y_out[1] = ~a_in[1] &  a_in[0];
assign y_out[2] =  a_in[1] & ~a_in[0];
assign y_out[3] =  a_in[1] &  a_in[0];

endmodule

