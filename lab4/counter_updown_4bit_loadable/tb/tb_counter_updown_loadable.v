module tb_counter_updown_4bit_loadable();
reg clock,reset,load,control;
reg [3:0] input_data;
wire [3:0] count;
integer i,j;

counter_updown_4bit_loadable DUT(.clk(clock),.rst(reset),.load(load),.ctrl(control),.data_in(input_data),.count(count));

parameter CYCLE = 10;

task initialize;
begin
clock = 0'b0;
load = 0'b0;
control = 0'b1;
input_data = 4'b0;
end
endtask

always begin
#(CYCLE/2) clock = ~clock;
end

task reset_call();
begin
@(negedge clock);
reset = 1'b1;
repeat(1)
@(negedge clock);
reset = 1'b0;
end
endtask

task dir_change(input x);
begin
@(negedge clock);
control = x;
end
endtask

task loading(input [3:0] value);
begin
load = 1'b1;
{input_data} = value;
#(CYCLE/2) load = 1'b0;
end
endtask

initial begin
initialize;
#25 reset_call;
  for(i=0;i<16;i=i+1) begin
   for(j=0;j<2;j=j+1) begin
     loading(i);
     dir_change(j);
     #50;
    end
   end
#40 reset_call;     
#120 $finish;
end

initial begin
$monitor("clock=%b reset=%b load=%b control=%b input_data=%4b count=%4b",clock,load,reset,control,input_data,count);
end

endmodule
