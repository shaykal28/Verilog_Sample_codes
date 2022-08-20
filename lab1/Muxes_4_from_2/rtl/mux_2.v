module mux_2(input wire [1:0] i,
             input wire s,
             output out);

assign out = s ? i[1] : i[0];

endmodule





 
