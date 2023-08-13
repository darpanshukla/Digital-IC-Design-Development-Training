`include "full_adder.v"
module full_adder_tb; 

reg tba, tbb, tbcin;
wire tbsum, tbcout;
reg i;

full_adder DUT(.a(tba), .b(tbb), .cin(tbcin), .sum(tbsum), .cout(tbcout));


parameter timestamp = 80, timestamp1=timestamp/2,timestamp2=timestamp/4,timestamp3=timestamp/8;

initial 
#timestamp
$finish;

initial begin
	tba=1;
	#timestamp1;
	tba=0;
	end
initial begin
	tbb   = 0;
	forever 
	#timestamp2
	tbb   = ~tbb;
	end
initial begin
	tbcin = 0; 
	forever
	#timestamp3
	tbcin = ~tbcin;
	end
initial begin
	$dumpfile("full_adder.vcd");
	$dumpvars;
	end
endmodule
