`timescale 1ns/100ps
module clkdiv3_tb;
  reg clk,reset;
  wire [1:0] pos_count,neg_count;
  wire clk_out;
 
	clk_div_3 DUT(.clk(clk),.reset(reset),.pos_count(pos_count),.neg_count(neg_count),.clk_out(clk_out));

	initial begin
            	clk= 1'b0;
		reset = 1'b0;
	end

     	always begin
        	#5  clk=~clk; 
	end

        initial
            begin
               #25 reset=1'b1;
               #10 reset=1'b0;
	       #150 reset = 1'b1;
	       #20 reset = 1'b0;
               #500 $finish;
         end
 
        initial begin
               $monitor("clk=%b,reset=%b,pos_count=%2b,neg_count=%2b,clk_out=%b",clk,reset,pos_count,neg_count,clk_out);
	end
 
        initial begin
              $dumpfile("clkdiv3_tb.vcd");
              $dumpvars(0,clkdiv3_tb);
        end

    endmodule
