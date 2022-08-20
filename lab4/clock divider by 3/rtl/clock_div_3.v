module clk_div_3(input clk,reset,
		 output reg [1:0] pos_count, neg_count, 
		 output clk_out);
 
	always @(posedge clk) begin
		if (reset)
			pos_count <=0;
		else if (pos_count ==2) 
			pos_count <= 0;
		else 
			pos_count<= pos_count +1;
	end
 
	always @(negedge clk) begin
		if (reset)
			neg_count <=0;
		else  if (neg_count == 2) 
			neg_count <= 0;
		else 
			neg_count<= neg_count +1;
	end
 
assign clk_out = ((pos_count == 2) | (neg_count == 2));
endmodule
