module RCAdder_4bit(input [3:0] x,y,
                    input cin,
                    output [3:0] sum,
                    output cout);
wire c1,c2,c3;

full_adder_df fa0(.a(x[0]),.b(y[0]),.c(cin),.sum(sum[0]),.carry(c1));
full_adder_df fa1(.a(x[1]),.b(y[1]),.c(c1),.sum(sum[1]),.carry(c2));
full_adder_df fa2(.a(x[2]),.b(y[2]),.c(c2),.sum(sum[2]),.carry(c3));
full_adder_df fa3(.a(x[3]),.b(y[3]),.c(c3),.sum(sum[3]),.carry(cout));

endmodule
