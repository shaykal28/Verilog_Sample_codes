module ram_async_dp(input wr_clock,rd_clock,wr_enb,rd_enb,reset,
					input [ADDRESS-1:0] wr_addr,rd_addr,
					input [WIDTH-1:0] data_in,
					output reg [WIDTH-1:0] data_out);

  parameter WIDTH = 8,
 	        DEPTH = 16,
	        ADDRESS = 4;

reg [WIDTH-1:0] mem [DEPTH-1:0];

integer i;

always@(posedge wr_clock or negedge reset) begin  //write logic
  if(!reset) begin
	for(i=0;i<DEPTH;i=i+1) begin
		mem[i] <= 8'b0;
	end
  end

  else if(wr_enb == 1 && rd_enb == 0) begin
	mem[wr_addr] <= data_in;
  end
end

always@(posedge rd_clock or negedge reset) begin  //read logic 
  if(!reset) begin
	data_out <= 8'b0;
  end

  else if(wr_enb == 0 && rd_enb == 1) begin
	data_out <= mem[rd_addr];
  end
end

endmodule

