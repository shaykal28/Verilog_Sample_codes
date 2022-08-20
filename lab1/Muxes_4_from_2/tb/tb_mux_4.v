module tb_mux_4();

 reg [3:0] a;
 reg [1:0] s;
 wire out;

 //instantiation
 mux_4 DUT(.y(a),.sel(s),.out(out));

 //stimulus generation
 
 initial 
  begin
   a = 4'b1010;
   s = 2'b01;
   #10;
   s = 2'b00;
   #10;
   s = 2'b10;
   #10;
   a = 4'b1100;
   #10;
   s = 2'b11;
   end
 initial
  begin
  $monitor("a=%4b s=%2b out=%0b",a,s,out); 
  end

initial #150 $finish;



 endmodule
