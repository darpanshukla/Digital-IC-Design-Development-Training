`include "inverter.v"
module inverter_tb ();
	// clock and reset 
	
	// design pramane variable
	// design inputs
	reg tba,tba2;
	// design outputs
	wire tby,tby2;

	// DUT instantiation - fix
	inverter inv1( .a(tba), .y(tby) );
	inverter inv2( .a(tba2), .y(tby2));

	// input specification - variable
	initial begin
			#10
			tba=0;tba2 =1;
			#10
			tba=1;tba2= 0;
		end
		//simulation time define -fix
	initial 
		#100
		$finish;

		//storage fix
	initial begin
			$dumpfile("inverter.vcd");
			$dumpvars;
		end

endmodule
