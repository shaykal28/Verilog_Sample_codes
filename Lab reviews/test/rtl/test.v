module test(input c,r,
	    output reg q);

always@(posedge c) begin
 if(r)
  q <= 0;
 else
 q <= q+1;
end

endmodule
