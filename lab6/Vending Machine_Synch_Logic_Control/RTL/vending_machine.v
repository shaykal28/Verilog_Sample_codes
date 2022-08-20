module vending_machine(input [1:0] coin_amt, input clock, reset, output reg product_delivered,return_amt);

	parameter 
		IDLE = 2'b00,
		State1 = 2'b01,
		State2 = 2'b10;
				
	reg [1:0] present_state, next_state;
	
	/* Present State Logic */
	always@(posedge clock, posedge reset)
		begin
			if(reset)
				present_state <= IDLE;
			else
				present_state <= next_state;
		end
				
	/* Combinational Logic for Next state Input*/			
	
	always@(present_state,coin_amt)
		begin
			next_state = IDLE;		
			case(present_state)
			
				IDLE : if(coin_amt == 2'd1)
							next_state = State1;
						else if (coin_amt == 2'd2)
							next_state = State2;
						else
							next_state = IDLE;
				
				State1 : if(coin_amt == 2'd1)
							next_state = State2;
						else
							next_state = IDLE;
							
				State2 : next_state = IDLE;
				
				default : next_state = IDLE;
			endcase
		end
	
	/* Sequential Logic for Determining the states */
	always@(posedge clock , posedge reset)
		begin
			if(reset)
				{product_delivered, return_amt} <= {1'b0, 1'b0};
			else
				begin
					{product_delivered, return_amt} <= {1'b0, 1'b0};
					case(present_state)
						IDLE : {product_delivered, return_amt} <= {1'b0, 1'b0};
						
						State1 : if(coin_amt == 2'd2)
									{product_delivered, return_amt} <= {1'b1, 1'b0};
								else
									{product_delivered, return_amt} <= {1'b0, 1'b0};
						
						State2 : if(coin_amt == 2'd1)
									{product_delivered, return_amt} <= {1'b1, 1'b0};
								else if (coin_amt == 2'd2)
									{product_delivered, return_amt} <= {1'b1, 1'b1};
								else
									{product_delivered, return_amt} <= {1'b0, 1'b0};
						
						default : {product_delivered, return_amt} <= {1'b0, 1'b0};
					endcase
				end
		end
		
endmodule