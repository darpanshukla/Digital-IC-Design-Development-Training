`include "half_adder.v"

module half_adder_tb ();

	// Design inputs and outputs
	reg tba,tbb;
	wire tbsum, tbc;

	// DUT instantiation

	half_adder DUT(
		.a(tba),
		.b(tbb),
		.sum(tbsum),
		.carry(tbc)
		);
	
	initial
		#50
		$finish;
	initial 
	begin
		#10
		tba = 0;
		tbb = 0;
		#10
		tba = 0;
		tbb = 1;
		#10
		tba = 1;
		tbb = 0;
		#10
		tba = 1;
		tbb = 1;
	end
	initial
	begin
		$dumpfile("half_adder.vcd");
		$dumpvars;
	end
endmodule
		
