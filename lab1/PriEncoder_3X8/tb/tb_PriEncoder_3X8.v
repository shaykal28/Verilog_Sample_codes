module tb_PriEncoder_3X8();
reg [7:0] data_in;
reg enable;
wire [2:0] data_out;
integer i;

PriEncoder_3X8 DUT(.D(data_in),.V(enable),.Y(data_out));

initial
begin
data_in = 8'b00000000;
enable = 0'b1;
end

initial
begin
	for(i=0;i<256;i=i+8) begin
	  {data_in} = i;
	   #10;
	end
#50 $finish;
end

initial
begin
$monitor("data_in=%8b enable=%0b data_out=%3b",data_in,enable,data_out);
end

endmodule

