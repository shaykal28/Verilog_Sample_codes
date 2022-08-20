module tb_SR_latch();
reg s,r,en;
wire q,qbar;
integer i;

sr_latch DUT(.S(s),.R(r),.enable(en),.Q(q),.Qb(qbar));

initial begin
s = 1'b0;
r = 1'b0;
en = 1'b0;
end

initial begin
 #5 en = 1'b1;
 #5 s = 1'b1; r = 1'b0;
 #10 s = 1'b0; r = 1'b0;
 #10 s = 1'b0; r = 1'b1;
 #10 s = 1'b0; r = 1'b0;
 #10 s = 1'b1; r = 1'b1;
 #20 $finish;

end

initial begin
$monitor("s=%0b,r=%0b,en=%0b,q=%0b,qbar=%0b",s,r,en,q,qbar);
end

endmodule
