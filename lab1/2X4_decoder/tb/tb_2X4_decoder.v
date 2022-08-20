module tb_2X4_decoder();
 reg x,y,enable;
 wire z0,z1,z2,z3;
 integer i;

 //instantiation
 decoder_2X4 DUT(.a0(x),.a1(y),.en(enable),.y0(z0),.y1(z1),.y2(z2),.y3(z3));

//stimulus
 
 initial begin
 enable = 1'b1;
 x = 0'b0; y = 0'b0;
 end
 

 initial begin
 for(i=0;i<4;i=i+1) begin
 {y,x} = i;
 #10;
 end
 end
 
 initial begin
 $monitor("x=%0b y=%0b z0=%0b z1=%0b z2=%0b z3=%0b",x,y,z0,z1,z2,z3);
 end

 initial #100 $finish;

endmodule
