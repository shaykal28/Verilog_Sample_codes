module tb_PISO;

	// Inputs
	reg [3:0] in;
	reg load;
	reg clk;
	reg rst;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	PISO uut (
		.d_out(out), 
		.d_in(in), 
		.load(load), 
		.clock(clk), 
		.reset(rst)
	);
always #20 clk = ~clk;
	initial begin
		// Initialize Inputs
		in = 4'b1101;
		load = 0;
		clk = 0;
		rst = 0;
		@(posedge clk);
		rst = 1'b1;
		repeat(2) @(posedge clk);
		rst = 1'b0;
		load = 1'b1;
		@(posedge clk);
		load = 1'b0;
		#150 @(posedge clk);
		load = 1'b1;
		@(posedge clk);
		load = 1'b0;
	end
      
endmodule
