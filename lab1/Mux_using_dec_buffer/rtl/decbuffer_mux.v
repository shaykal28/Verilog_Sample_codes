module decbuffer_mux(input [3:0] data_in, 
		     input [1:0] sel,
		     output data_out);

wire [3:0] w;
wire s0,s1,s2,s3;


decoder d0(.a_in(sel),.y_out(w));

bufif1 b0(data_out,data_in[0],w[0]);
bufif1 b1(data_out,data_in[1],w[1]);
bufif1 b2(data_out,data_in[2],w[2]);
bufif1 b3(data_out,data_in[3],w[3]);


endmodule
