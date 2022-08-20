module tb_mux_2();

 reg [1:0] a;
 reg s;
 wire out;

 //instantiation
 mux_2 DUT(.i(a),.s(s),.out(out));

 //stimulus generation
 
 initial 
  begin
   a = 2'b01;
   s = 1'b0;
   #10;
   s = 1'b1;
   #10;
   s = 1'b0;
   #10;
   a = 2'b10;
   #10;
   s = 1'b1;
   end
 initial
  begin
  $monitor("a[0]=%0b a[1]=%0b s=%0b out=%0b",a[0],a[1],s,out); 
  end

initial #150 $finish;



 endmodule
