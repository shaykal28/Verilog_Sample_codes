module tb_alu();
    
   //Testbench global variables
   reg [7:0]a,b;
   reg [3:0]command;
   reg enable;
   wire [15:0]out;
   integer i;

//instantiation
alu DUT(.a_in(a),.b_in(b),.command_in(command),.oe(enable),.d_out(out));

//stimulus generation:

 initial begin
  enable = 1'b1;
  a = 8'hC9; //a = 1100_1001
  b = 8'hA5; //b = 1010_0101
  
  command = 4'bxxxx;

 end

 initial begin 
  for(i=0;i<16;i=i+1) begin
  command = i;
  #10;
  end
 end

 initial begin
  $monitor("a=%8b b=%8b command=%4b out%16b",a,b,command,out);
end

 initial #200 $finish;

endmodule
