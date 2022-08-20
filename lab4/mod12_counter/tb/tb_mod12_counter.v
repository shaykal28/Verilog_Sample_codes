module tb_mod12_counter();
reg [3:0] data_in;
reg clk,rst,load;
wire [3:0] count;
integer i;

mod12_counter DUT(.data(data_in),.clock(clk),.reset(rst),.load(load),.count(count));

parameter CYCLE = 10;

task initialize();
begin
clk = 0'b0;
rst = 0'b0;
load = 0'b0;
end
endtask

always begin
#(CYCLE/2) clk = ~clk;
end

task rst_call();
begin
@(negedge clk);
rst = 1'b1;
repeat(1)
@(negedge clk);
rst = 1'b0;
end
endtask

task loading( input [3:0] word);
begin
load = 1'b1;
{data_in} = word;
@(negedge clk);
load = 1'b0;
end
endtask


initial begin
initialize;
#5 rst_call;
#190;
for(i=0;i<16;i=i+1) begin
    loading(i);
    #45;
end
#10 rst_call;
#20 loading(4'b1010);
$finish;
end

initial begin
$monitor("clock=%b reset=%b load=%b data_in=%4b count=%4b",clk,rst,load,data_in,count);
end


endmodule

