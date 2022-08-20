module clk_div_5(input clk,reset,
		 output reg [2:0] pos_count, neg_count, 
		 output reg clk_out);
 
	always @(posedge clk) begin
		if (reset)
			pos_count <=0;
		else if (pos_count == 3'd4) 
			pos_count <= 0;
		else 
			pos_count<= pos_count +1'b1;
	end
 
	always @(negedge clk) begin
		if (reset)
			neg_count <=0;
		else  if (neg_count == 3'd4) 
			neg_count <= 0;
		else 
			neg_count<= neg_count + 1'b1;
	end
 
	always@(*) begin
		if (reset)
			clk_out = 1'b0;
		else
			clk_out = ((pos_count < 3'd3) & (neg_count < 3'd3));
	end
endmodule
