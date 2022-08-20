module ring_counter(input [3:0] d_in,
		    input clock,reset,load,
		    output [3:0] count);

reg [3:0] temp;

always@(posedge clock) begin
  if(reset) begin
	temp <= 4'b0;
  end

  else if(load) begin
	temp <= d_in;
  end

  else begin
	temp <= temp>>>1;
  end
end

assign count = temp;

end;
	
