module tb_SIPO();
reg clock,reset,d_in;
wire [7:0] d_out;

SIPO_special DUT(.clock(clock),.reset(reset),.d_in(d_in),.d_out(d_out));

task initialize;
begin
 clock = 1'b0;
 reset = 1'b1;
 d_in = 1'b0;
end
endtask 

always begin
#5 clock = ~ clock;
end

task reset_call();
begin
 @(negedge clock);
 reset = 1'b0;
 repeat(2)
 @(negedge clock);
 reset = 1'b1;
end
endtask

task input_stimulus(input y);
begin
d_in = y;
end
endtask

initial begin
 initialize;
 #5 reset_call;
 @(negedge clock);
 input_stimulus(1);
 @(negedge clock);
 input_stimulus(1);
 @(negedge clock);
 input_stimulus(1);
 @(negedge clock);
 input_stimulus(0);
 @(negedge clock);
 input_stimulus(1);
 @(negedge clock);
 input_stimulus(1);
 #100 reset_call;
 @(negedge clock);
 input_stimulus(1);
 @(negedge clock); 
 input_stimulus(0);
 @(negedge clock);
 input_stimulus(1);
 #200 $finish;
end

endmodule

