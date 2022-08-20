module PISO(input clock,reset,load,
	    input [3:0] d_in,
	    output d_out);
reg [3:0] temp;

always@(posedge clock) begin
 if(reset) begin
	temp <= 4'b0;
 end

 else if(load) begin
 	temp <= d_in;
 end
 
 else begin
	temp <= (d_in>>1);
 end
end

assign d_out = temp[0];

endmodule

/*
module PISO( output out,
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
	end
end
assign 	out = temp[0];
endmodule
*/
