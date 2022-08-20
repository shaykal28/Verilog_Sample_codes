module tb_RCAdder_4bit();
reg [3:0] a,b;
reg c;
wire [3:0] sum_out;
wire carry;

//instantiation
RCAdder_4bit DUT(.x(a),.y(b),.cin(c),.sum(sum_out),.cout(carry));

//stimulus generation:
 
initial begin
a = 4'b0000;
b = 4'b0000;
c = 1'b0;
end

initial begin 

#10;
a = 4'b1100;
b = 4'b1110;
c = 1'b0;

#20;
a = 4'b1010;
b = 4'b0111;
c = 1'b1;
 end

initial begin
$monitor("a=%4b b=%4b c=%4b sum_out=%4b carry=%4b",a,b,c,sum_out,carry);
end

initial #100 $finish;


endmodule










