/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   mux4_1.v   

Description :      Mux 4:1 design

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/
 
module mux4_1(input [3:0] data_in,
	      input [1:0] sel_in,
	      output reg y_out);

reg [3:0] temp = 4'b0000;     
 

   //Step2 : Write the MUX behaviour as a parallel logic using "case" 
 always@(*) begin
 y_out = temp;
   case(sel_in)
	2'b00 : y_out = data_in[0];
	2'b01 : y_out = data_in[1];
	2'b10 : y_out = data_in[2];
	2'b11 : y_out = data_in[3];
   endcase
 end

  
endmodule
		
