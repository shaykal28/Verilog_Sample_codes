module bidir_buf(inout a,b,
		 input ctrl);

bufif1 b0(a,b,ctrl);
bufif0 b1(b,a,ctrl);

endmodule
