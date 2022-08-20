module clockbuffer_tb();
reg in_clock;
wire buffered_clock;
reg b_clock;
time f2,f1;
time t1,t2,t3,t4;

clockbuffer dut (in_clock,buffered_clock);
task initialise();
begin
in_clock=1'b0;
t1=1'b0;
t2=1'b0;
t3=1'b0;
t4=1'b0;
end
endtask

task clock_gen();
begin
forever #10 in_clock=~in_clock;
end
endtask


task phase1();
begin
fork
@(posedge in_clock)
t1=$time;
@(posedge buffered_clock)
t3=$time;
join
end
endtask

task phase2();
begin
fork

@(posedge in_clock)
t2=$time;
@(posedge buffered_clock)
t4=$time;

join
end

endtask

task frequency_calculation();
begin
f1=t2-t1;
f2=t4-t3;
begin
if(f2==f1)
$display("frequency check successful");
else
$display("frequency check unsuccessful");
end
end
endtask
initial
begin
clock_gen();
end
initial
begin
b_clock=buffered_clock;
end
initial
begin
initialise();
#20;
phase1();
phase2();
frequency_calculation();
#1000; $finish;
end
endmodule







