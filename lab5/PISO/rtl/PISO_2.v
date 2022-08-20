`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:21 07/31/2020 
// Design Name: 
// Module Name:    PISO 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PISO( output reg out,
             input  [3:0] in,
				 input load,clk,rst
    );
reg [3:0] temp;
always@(posedge clk or posedge rst) begin
	if(rst) begin
		temp <= 4'b0000;
	end
	else if(load)
	temp <= in;
	else begin
	temp <= {1'b0,temp[3:1]};
	out <= temp[0];
	end
end
endmodule
