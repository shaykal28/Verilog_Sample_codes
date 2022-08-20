module tb_SIPO;

	// Inputs
	reg in;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] out;

	// Instantiate the Design Under Test (DUT)
	SIPO DUT (
		.d_out(out), 
		.d_in(in), 
		.clock(clk), 
		.reset(rst)
	);
always #20 clk = ~clk;
	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		rst = 0;
		@(posedge clk);
		rst = 1'b1;
		repeat(2) @(posedge clk);
		rst = 1'b0;
		in = 1'b1;
		@(posedge clk);
		in = 1'b1;
		@(posedge clk);
		in = 1'b1;
		@(posedge clk);
		in = 1'b0;
		@(posedge clk);
		in = 1'b1;
		@(posedge clk);
		in = 1'b0;
		@(posedge clk);
		in = 1'b1;
		@(posedge clk);
		in = 1'b0;
		@(posedge clk);
		in = 1'b1;
		#400 $finish();

	end
      
endmodule
