module JK_ff(input J,K,clock,rst,
	     output reg Q,
	     output Qb);
parameter HOLD     = 2'd0, 
	      SET      = 2'd2,
	      RESET    = 2'd1,
          TOGGLE   = 2'd3;

always@(posedge clock) begin
   if(rst)
        Q<=0;
   else
	begin
	  case({J,K})
		HOLD   : Q <= Q;
		SET    : Q <= 1;
		RESET  : Q <= 0;
		TOGGLE : Q <= ~Q;
		default : Q <= 1'bz;
	   endcase
	end
end

assign Qb = ~Q;

endmodule

