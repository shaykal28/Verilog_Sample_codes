module tb_SIPO_lr();

reg clock,reset,load,data_in,dir;
wire [3:0] data_out;

SIPO_lr DUT(.clock(clock),.reset(reset),.load(load),.dir(dir),.data_in(data_in),.data_out(data_out));

parameter CYCLE = 10;

task initialize;
begin
 clock = 1'b0;
 reset = 1'b0;
 load = 1'b0;
 dir = 1'b0;
end
endtask

always begin
 #(CYCLE/2) clock = ~clock;
end

task reset_call();
begin
 @(negedge clock);
 reset = 1'b1;
 repeat(2)
 @(negedge clock);
 reset = 1'b0;
end
endtask

task loading(input x);
begin
load = x;
end
endtask

task input_stimulus(input y);
begin
data_in = y;
end
endtask

task direction(input z);
begin
dir = z;
end
endtask

initial begin
 initialize;
 #5 reset_call;
 #5 loading(1);
    input_stimulus(1);
 #2 input_stimulus(1);
 #15 loading(0);
 #45 direction(1);
     loading(0);
 #30 loading(1); 
 #2 input_stimulus(0);
 #2 input_stimulus(1);
 #15 loading(0);
 #10 direction(0);
 #70 $finish;
end

endmodule
  
