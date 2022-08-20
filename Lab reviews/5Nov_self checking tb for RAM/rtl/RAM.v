module ram(clock,reset,wr_enb,rd_enb,wr_addr,rd_addr,data_in,data_out);
   
  parameter WIDTH = 8,
 	    DEPTH = 16,
	    ADDRESS = 4;

input clock,reset,wr_enb,rd_enb;
input [ADDRESS-1:0] wr_addr,rd_addr;
input [WIDTH-1:0] data_in;
output reg [WIDTH-1:0] data_out;

integer i;

reg [WIDTH-1:0] mem [DEPTH-1:0];

always@(posedge clock) begin

    if(reset) begin
	for(i=0;i<DEPTH;i=i+1) begin
	    mem[i] = 0;
	end
    end

    else begin
  	if(wr_enb) begin
	   mem[wr_addr] <= data_in;
	end
	if(rd_enb) begin
	   data_out <= mem[rd_addr];
	end
    end

end

endmodule
