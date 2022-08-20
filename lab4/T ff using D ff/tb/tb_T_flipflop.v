module tb_T_flipflip();
reg clk,rst,t_in;
wire Q,Q_bar;

integer i;

T_flipflop DUT(.clock(clk),.reset(rst),.T(t_in),.Q(Q),.Qb(Q_bar));

task initialize();
begin
clk = 0'b0;
rst = 0'b0;
t_in = 0'b0;
end
endtask

always begin
#5 clk = ~clk;
end

task reset_call();
begin
@(negedge clk);
rst = 1'b1;
repeat(1)
@(negedge clk);
rst = 1'b0;
end
endtask

task stimuli(input x);
begin
@(posedge clk);
t_in = x;
end
endtask

initial begin
  initialize;
  for(i=0;i<4;i=i+1) begin
	stimuli({i});
	#10;
  end
 reset_call();
 #15 stimuli(0);
 #10 stimuli(1);
 #10 stimuli(1);
 #15 stimuli(0);
 #20 stimuli(1);
 #10 reset_call();
 #15 stimuli(0);
 #10 stimuli(0);

#50 $finish;

end

endmodule


