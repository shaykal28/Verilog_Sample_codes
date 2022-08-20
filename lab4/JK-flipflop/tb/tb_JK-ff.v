`timescale 1ns/1ns

module tb_JK_ff();
reg j,k,clk,reset;
wire q,qb;

integer i;

parameter  CYCLE    = 10,
	       HOLD     = 2'd0,
           SET      = 2'd2,
	       RESET    = 2'd1,
           TOGGLE   = 2'd3;

JK_ff DUT(.J(j),.K(k),.clock(clk),.rst(reset),.Q(q),.Qb(qb));

initial begin
clk = 1'b0;
reset = 1'b0;
j = 1'b0;
k = 1'b0;
end

always begin
#(CYCLE/2) clk = ~clk;
end

task reset_call;
begin
@(negedge clk);
     reset = 1'b1;
repeat(2)
@(negedge clk);
     reset = 1'b0;
end
endtask

task stimuli(input [1:0] y);
begin
@(negedge clk); 
 begin
 {j,k} = y;
 end
end
endtask

initial begin
  #5;
  reset_call;
  for(i=0;i<4;i=i+1) begin
	stimuli(i);
	#10;
  end
#200 $finish;
end

initial begin
$monitor("j=%b k=%b reset=%b Q=%b Qbar=%b",j,k,reset,q,qb);
end

endmodule










