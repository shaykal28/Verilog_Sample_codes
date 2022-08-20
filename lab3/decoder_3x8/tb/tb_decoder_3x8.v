`timescale 1ns/1ns

module tb_decoder_3x8();

 reg [2:0] in;
 wire [7:0] out;
 integer i;


 decoder_3x8 DUT(.data_in(in),.data_out(out));
 
 task initialize();
  begin
   in = 3'b000;
  end
 endtask
 
 task stimulus(input [2:0] x);
  begin 
   in = x;
  end
 endtask

 initial begin
   initialize;
   #10;
   for(i=0;i<8;i=i+1) begin
     stimulus(i);
     #10;
   end
  $finish;
 end
 
 initial begin
  $monitor("in =%3b out=%8b",in,out);
 end


endmodule


