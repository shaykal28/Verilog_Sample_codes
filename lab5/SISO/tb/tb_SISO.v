module tb_SISO();

reg clk,rst,D_in;
wire D_out;
integer i;

SISO DUT(.clock(clk),.reset(rst),.data_in(D_in),.data_out(D_out));

task initialize();
begin
clk = 1'b0;
rst = 1'b0;
D_in = 1'b0;
end endtask

always begin
#5 clk = ~clk;
end

task reset_call();
begin
rst = 1'b1;
repeat(2)
@(posedge clk);
rst = 1'b0;
end
endtask

task stimulus(input x);
begin
@(posedge clk);
{D_in} = x;
end
endtask

initial begin
initialize;
 for(i=0;i<16;i=i+1) begin
    stimulus(i);
    #10;
 end
#10 stimulus(1);
#10 stimulus(1);
#10 stimulus(0);
#10 stimulus(1);
#2 reset_call;
#10 stimulus(1);
#10 stimulus(1);
#10 stimulus(0);
#10 stimulus(1);

#20 $finish;
end

initial begin
$monitor("clock=%b reset=%b input=%b output=%b",clk,rst,D_in,D_out);
end

endmodule

	

 
