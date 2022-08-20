/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   full_adder_df.v   

Description :      Full adder Design using dataflow

Author Name :      LakshayK

Version     :      1.0
*********************************************************************************************/
  
module full_adder_df(input a,b,c,
	             output sum,carry);
				 
   //Understand the Data-flow abstraction
   assign sum   = a ^ b ^ c;
   assign carry = (a & b) | (b & c) | (a & c);

endmodule
	
	
	
	

	
	
