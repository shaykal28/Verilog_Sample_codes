module mod12_counter(input [3:0] data,
		     input load,clock,reset,
	             output reg [3:0] count);


always@(posedge clock) begin
  if(reset) begin
     count <= 4'b0000;
  end
 
  else if(load) begin
          count <= data;
  end
  else if(data > 11) begin
     count <= 4'b0000;
  end
  
  else if(count==4'd11) begin
	 count <= 4'b0;
  end
  
  else begin
     count <= count + 1;
  end
end



endmodule
