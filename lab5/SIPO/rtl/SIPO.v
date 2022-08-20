module SIPO(input clock,reset,d_in,
	    output [3:0] d_out);
reg [3:0] temp;

always@(posedge clock) begin
 if(reset) begin
  temp <= 4'b0;
 end

 else begin
  temp <= {d_in,temp[3:1]};
 end
end

assign d_out = temp;

endmodule
