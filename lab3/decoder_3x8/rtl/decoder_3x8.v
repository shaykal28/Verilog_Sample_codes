module decoder_3x8(input [2:0] data_in,
                   output reg [7:0] data_out);

 always@(data_in) begin
  case(data_in) 
  3'b000 : data_out = 8'h01;
  3'b001 : data_out = 8'h02;
  3'b010 : data_out = 8'h04;
  3'b011 : data_out = 8'h08;
  3'b100 : data_out = 8'h10;
  3'b101 : data_out = 8'h20;
  3'b110 : data_out = 8'h40;
  3'b111 : data_out = 8'h80;
  endcase
 end

endmodule 
