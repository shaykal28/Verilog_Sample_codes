module tb_decbuffer_mux();

 reg [3:0] a;
 reg [1:0] s;
 wire out;
 integer i;

 //instantiation
 decbuffer_mux DUT(.data_in(a),.sel(s),.data_out(out));

 //stimulus generation
 
 initial 
  begin
   a = 4'b0000;
   s = 2'b00;
  end

 initial begin
	for(i=0;i<64;i=i+1) begin
	  {a,s} = i;
	  #10;
	 end
   #50 $finish;
 end

 initial
  begin
  $monitor("a=%4b s=%2b out=%0b",a,s,out); 
  end

endmodule
