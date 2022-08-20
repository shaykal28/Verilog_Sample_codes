`timescale 1ns/1ns

module tb_priencoder_8x3();
  reg [7:0] in;
  reg enb;
  wire [2:0] out;

  integer j;

  priencoder_8x3 DUT(.data_in(in),.enable(enb),.data_out(out));

  task initialize(); 
    begin
      in = 8'b00000000;
      enb = 1'b0;
    end
  endtask
 
  task enable_change(input x);
     begin
	enb = x;
     end
   endtask
 
   task stimulus( input [7:0] y);
      begin
	 in = y;
      end
    endtask

  initial begin
     initialize;
     #10;
     enable_change(1);
	for(j=0;j<256;j=j+8) begin
	    stimulus(j);
	    #10;
	end
      #50 enable_change(0);
      #50 $finish;
   end

   initial begin
  	$monitor("in=%8b enb=%b out=%3b",in,enb,out);
    end


endmodule
		
     
