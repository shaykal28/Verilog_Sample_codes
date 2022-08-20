module priencoder_8x3(input [7:0] data_in,
		      input enable,
		      output reg [2:0] data_out);

 always@(data_in,enable) begin
    if(enable) begin
        if(data_in[7])
			data_out = 3'b111;
	    else if(data_in[6])
			data_out = 3'b110; 
        else if(data_in[5])
			data_out = 3'b101;
        else if(data_in[4])
			data_out = 3'b100;
        else if(data_in[3])
			data_out = 3'b011;
        else if(data_in[2])
			data_out = 3'b010;
        else if(data_in[1])
			data_out = 3'b001;
        else if(data_in[0])
			data_out = 3'b000;
		else 
           data_out = 3'bzzz; 
       
    end
 end

endmodule

/*
module prienc(in,y);   //mohan
input [7:0]in;
output reg[2:0]y;
always@(in)
begin
casex(in)
8'b00000001 : y=3'd0;
8'b0000001x : y=3'd1;
8'b000001xx : y=3'd2;
8'b00001xxx : y=3'd3;
8'b0001xxxx : y=3'd4;
8'b001xxxxx : y=3'd5;
8'b01xxxxxx : y=3'd6;
8'b1xxxxxxx : y=3'd7;
default:y=3'bzzz;
endcase
end
endmodule
*/

/* 
module pricoder( 
output reg [2:0] out,
output reg valid,
input [7:0] in
 );
integer i;
always@(*)begin
valid = 0;
out = 3'b000;
	for(i=0;i<8;i=i+1)begin
		if(in[i]==1)begin
			out = i;
			valid = 1;
			end
	end
end
endmodule
*/

 	
