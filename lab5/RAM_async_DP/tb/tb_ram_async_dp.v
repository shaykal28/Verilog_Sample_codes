module tb_ram_async_dp();

parameter   CYCLE = 10,
            WIDTH = 16,
 	        DEPTH = 8,
	        ADDRESS = 4;

reg wr_clk,rd_clk,rst,write_en,read_en;
reg [ADDRESS-1:0] read_add, write_add;
reg [WIDTH-1:0] input_data;
wire [WIDTH-1:0] output_data;
integer i;

ram_dp_sync DUT(.rd_clock(rd_clk),.wr_clock(wr_clk),.reset(rst),.wr_en(write_en),.rd_en(read_en),.wr_addr(write_add),.rd_addr(read_add),.data_in(input_data),
            .data_out(output_data));

task initialize();
begin
rd_clk = 0'b0;
wr_clk = 0'b0;
rst = 0'b0;
read_add = 4'b0;
write_add = 4'b0;
input_data = 8'b0;
end
endtask

task write_start();
begin
#(CYCLE/2) wr_clk = ~wr_clk;
end
endtask

task rd_start();
begin
#(CYCLE/2) rd_clk = ~rd_clk;
end
endtask

task reset_call();
begin
rst = 1'b1;
repeat(2)
@(negedge clk);
rst = 1'b0;
end
endtask

task write_enable(input a);
begin
write_en = a;
end
endtask

task read_enable(input b);
begin
read_en = b;
end
endtask

task stimulus_wr(input [ADDRESS-1:0] x, input [WIDTH-1:0] y);
begin
write_add = x;
{input_data} = y;
end
endtask

task stimulus_rd(input [ADDRESS-1:0] m);
begin
{read_add} = m;
end
endtask


initial begin
initialize();
write_enable(1);
 for(i=0;i<16;i=i+1) begin
   stimulus_wr(i,i);
   #10;
 end
write_enable(0);
#20;
read_enable(1);
for(i=0;i<16;i=i+1) begin
   stimulus_rd(i);
   #10;
 end
read_enable(0);
#10 reset_call;
read_enable(1);
  for(i=0;i<16;i=i+1) begin
   stimulus_rd(i);
   #10;
   end
read_enable(0);

#50 $finish;

end
endmodule
 


