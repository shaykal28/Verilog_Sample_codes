module tb_ram_dp_sync();

parameter   CYCLE = 10,
            WIDTH = 8,
 	    DEPTH = 16,
	    ADDRESS = 4;

reg clk,rst,write_en,read_en;
reg [ADDRESS-1:0] read_add, write_add;
reg [WIDTH-1:0] input_data;
wire [WIDTH-1:0] output_data;
integer i;

ram_dp_sync DUT(.clock(clk),.reset(rst),.wr_en(write_en),.rd_en(read_en),.wr_addr(write_add),.rd_addr(read_add),.data_in(input_data),
            .data_out(output_data));

task initialize();
begin
clk = 0'b0;
rst = 0'b0;
read_add = 4'b0;
write_add = 4'b0;
input_data = 8'b0;
end
endtask

always begin
#(CYCLE/2) clk = ~clk;
end

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
 

