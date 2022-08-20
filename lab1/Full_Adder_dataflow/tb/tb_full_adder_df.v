/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   tb_full_adder_df.v   

Description :      One bit Full adder Testbench

Author Name :      LakshayK

Version     :      1.0
*********************************************************************************************/
module tb_full_adder_df();

 reg a_in,b_in,c_in;
 wire sum_out,carry_out;
 integer i;

// instantiation of design  
 full_adder_df DUT(.a(a_in),.b(b_in),.c(c_in),.sum(sum_out),.carry(carry_out));

//initial values of inputs
 initial
  begin
   a_in = 1'b0;
   b_in = 1'b0;
   c_in = 1'b0;
 end

//initial block to run simulation
 initial 
  begin 
   for(i=0;i<8;i=i+1) begin
    {a_in,b_in,c_in} = i;
    #10;
   end
  end

 initial 
  begin
      $monitor("Input a_in=%0b, b_in=%0b, c_in=%0b, Output sum_out=%0b, carry_out=%0b",a_in,b_in,c_in,sum_out,carry_out);
  end
 
 initial 
   begin
    #100
    $finish;
   end


endmodule
 


