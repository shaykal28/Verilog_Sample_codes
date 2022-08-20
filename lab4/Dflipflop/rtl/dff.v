/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   dff.v   

Description :      Delay Flipflop

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/
 
module dff(clock,
	   reset,
	   d_in,
	   Q_out,
	   Qb_out);

   //Step1 : Declare Port Directions
 input clock,reset,d_in;
 output reg Q_out,Qb_out;

   /*Understand the Behaviour of D flip-flop &
   check the coding style of synchronous reset*/

  always@(posedge clock)
    begin
	 if(reset) begin
	    Q_out <= 1'b0;
	    Qb_out <= 1'b1;
	 end
      else begin
	    Q_out <= d_in;
	    Qb_out <= ~d_in;
      end		
     end			
 
endmodule          


