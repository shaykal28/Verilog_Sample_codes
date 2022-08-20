/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   mux4_1_tb.v   

Description :      Mux 4:1 Testbench

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module mux4_1_tb();

   //Step1 : Write down the variables required for testbench
   reg [3:0] data;
   reg [1:0] select;
   wire out;
   integer i,j;		
								
   //Step2 : Instantiate the Design 
   mux4_1 m0(.data_in(data),.sel_in(select),.y_out(out));

   //Step3 : Declare a task to initialize inputs of DUT to 0
   task initialize();
    begin
    data =  4'b0000;
    select = 2'b00;
    end
   endtask

   //Step4 : Declare  tasks with arguments for driving stimulus to DUT
   task stimulus_data(input [3:0] x_data);
    begin
    data = x_data;
    end  
   endtask 


   task stimulus_select(input [1:0] y_select);
    begin
    select = y_select;
    end
   endtask
   
   //Step5 : Call the tasks from procedural process
   initial 
   begin
   initialize;
    for(i=0;i<16;i=i+1) begin
     stimulus_data(i);
	for(j=0;j<4;j=j+1) begin
   	  stimulus_select(j);
	  #10;
        end
     end
     $finish;
   end
   

   //Step6 : Use $monitor task to display inputs and outputs
   initial begin
   $monitor("data=%4b select=%2b output=%b",data,select,out);
   end

   //Step7 : Use $finish task to terminate the simulation at 100ns
   

   
endmodule

