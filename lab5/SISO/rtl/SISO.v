module SISO(  output data_out,
              input data_in,clock,reset
    ); 
reg [3:0] temp;
always@(posedge clock or posedge reset) begin
if(reset)
temp <= 4'b0000;
else 
temp <= {temp[2:0],data_in};
end
assign data_out = temp[3];
endmodule

