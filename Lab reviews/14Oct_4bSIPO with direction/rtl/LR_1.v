module SIPO_lr(input clock,reset,load,data_in,dir,
		      output [3:0] data_out);
reg [3:0] temp;

always@(posedge clock) begin
  if(reset) begin
     temp <= 4'b0;
  end

  else if(load) begin
      temp <= {data_in,temp[3:1]};
  end

  else if(dir) begin  //dir=1 will be used for right shift
     temp <= {temp[3:2],temp[3:2]};
  end

  else begin //dir =0 will shift left
     temp <= {temp[1:0],temp[1:0]};
  end

end

assign data_out = temp;

endmodule

