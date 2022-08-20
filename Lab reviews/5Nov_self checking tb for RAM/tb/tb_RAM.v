module tb_RAM();

parameter   WIDTH = 8,
 	    DEPTH = 16,
	    CYCLE = 1,
	    Thold = 0.01,
	    Tsetup = 0.01,
	    ADDRESS = 4;

reg clock,reset,wr_enb,rd_enb;
reg [ADDRESS-1:0] wr_addr,rd_addr;
reg [WIDTH-1:0] data_in;
wire [WIDTH-1:0] data_out;

ram DUT(.clock(clock),.reset(reset),.wr_enb(wr_enb),.rd_enb(rd_enb),.wr_addr(wr_addr),.rd_addr(rd_addr),
        .data_in(data_in),.data_out(data_out));

always begin
#(CYCLE/2) clock = 1'b0;
#(CYCLE/2) clock = 1'b1;
end

task reset_sync();
begin
  reset = 1'b1;
  rd_enb = 1'b1;
  rd_addr = 4'b1010;
  
    @(posedge clock);
    #Thold;
        if(data_out !== 8'b0) begin
	   $display("Reset functionality is not correct");
	   $display("error at %t",$time);
	   $stop;
	end
	else 
	   $display("Reset functionality is perfect");
   {reset,rd_enb,rd_addr} = 6'bx;
   #(CYCLE - Thold - Tsetup);
end
endtask

task write(input [3:0] write_add,input [7:0] data);
begin
reset = 1'b0;
wr_enb = 1'b1;
rd_enb = 1'b0;
wr_addr = write_add;
data_in = data;
end
endtask

task read_check(input [3:0] read_add);
begin
reset = 1'b0;
rd_enb = 1'b1;
wr_enb = 1'b0;
rd_addr = read_add;

    @(posedge clock);
    #(Thold);
	if(data_out !== 8'b11000011) begin
	   $display("Read functionality is not correct");
	   $display("error at %t",$time);
	   $stop;
	end
	else
	   $display("Read functionality is perfect");
   {reset,wr_enb,rd_enb,rd_addr} = 7'bx;
   #(CYCLE - Thold - Tsetup);
end
endtask

initial begin
 reset_sync;
 write(4'b1010,8'b11000011);
 read_check(4'b1010);
#100 $finish;
end

endmodule


 













