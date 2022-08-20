module tb_bidir_buf();
wire x,y;
reg control;
reg tempA, tempB;
integer i;

//instantiation

bidir_buf DUT(.a(x),.b(y),.ctrl(control));

//stimulus
assign x = (control==0)?tempA:1'bz;
assign y = (control==1)?tempB:1'bz;

initial 
begin
tempA = 1'b0;
tempB = 1'b0;
control = 1'b0;
end

initial begin
  for(i=0;i<8;i=i+1) begin
   {control,tempA,tempB} = i;
   #10;
  end
end


initial begin
$monitor("x=%b y=%b tempA=%b tempb=%b control=%b",x,y,tempA,tempB,control);
end

initial #100 $finish;

endmodule
