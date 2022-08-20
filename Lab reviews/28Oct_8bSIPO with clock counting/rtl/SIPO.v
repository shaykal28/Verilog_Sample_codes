module SIPO_special(input clock,reset,d_in,
	    output [7:0] d_out);

reg [7:0] temp;
reg [2:0] count;

always@(posedge clock) begin
   if(!reset) begin
	count <= 0;
   end
   else if(count == 3'b111)
        count <= 3'b0;
   else begin
  	count <= count + 1;
   end
end


always@(posedge clock) begin
  if(!reset) begin
     temp <= 8'b0;
  end
  else if(count < 'd5) begin
     temp <= {d_in,temp[7:1]};
  end
  else begin
     temp <= temp;
  end
end

assign d_out = temp;

endmodule

  
