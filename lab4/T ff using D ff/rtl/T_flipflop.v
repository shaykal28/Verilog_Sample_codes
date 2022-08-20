module T_flipflop(input clock,reset,T,
		          output wire Q,Qb);
wire ip;
reg op,op_bar;

assign ip = T^op;

dff DUT(.clock(clock),.reset(reset),.d(ip),.Q_out(op),.Qb_out(op_bar));

assign Q = op;
assign Qb = op_bar;

endmodule
