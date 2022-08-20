module vending_machine_tb();

	reg [1:0] coin_amt;
	reg clock, reset;
	wire product_delivered,return_amt;
	
	vending_machine DUT(coin_amt, clock, reset, product_delivered,return_amt);
		
	task clock_gen();
		begin
			forever #10 clock = ~clock;
		end
	endtask
	
	task initialize();
		begin
			clock = 0;
			reset = 0;
			coin_amt = 0;
		end
	endtask
	
	task reset_logic();
		begin
			@(negedge clock)
				reset = 1;
			@(negedge clock)
				reset = 0;
		end
	endtask
		
	task stimulus_coin(input [1:0] coin_input);
		begin
			@(negedge clock)
				coin_amt = coin_input;
		end
	endtask
	
	initial
		begin
			clock_gen();
		end
	
	initial
		begin
			initialize();
			reset_logic();
			stimulus_coin(2'd2);
			stimulus_coin(2'd2);
			#50;
			$finish;
		end
		
	initial
		begin
			$monitor("Time = %0d, Reset = %d Coin_Amount = %d Product_delivered = %d Return_Amount = %d ",$time,reset,coin_amt,product_delivered,return_amt);
		end

endmodule