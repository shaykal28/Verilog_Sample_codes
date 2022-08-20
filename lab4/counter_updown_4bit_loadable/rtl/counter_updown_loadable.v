module counter_updown_4bit_loadable(input clk,rst,load,ctrl,
				    input [3:0] data_in,
				    output reg [3:0] count);

always@(posedge clk) begin
  if(rst) begin
     count <= 4'b0;
  end

  else if(load) begin
	count <= data_in;
  end

  else if(ctrl) begin
	count <= count + 1;
  end

  else begin
	count <= count -1;
  end

end

endmodule
