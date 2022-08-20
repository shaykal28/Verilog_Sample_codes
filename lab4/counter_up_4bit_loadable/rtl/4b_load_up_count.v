module counter_4bit_load_up(input [3:0] data,
		 	  input load,clock,reset,
			  output reg [3:0] count);


always@(posedge clock) begin
  if(reset) begin
     count <= 4'b0000;
  end
 
  else if(load) begin
          count <= data;
  end
  else begin
     count <= count + 1'b1;
  end
end



endmodule
