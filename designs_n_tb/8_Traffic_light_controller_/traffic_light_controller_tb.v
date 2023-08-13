`include "traffic_light_controller_non_uniform.v"
module traffic_light_controller_tb;

reg tbclk, tbmode;

wire [11:0] tblightout;

always #10 tbclk = ~tbclk;

initial begin tbclk = 1'b0; tbmode = 1; end

traffic_light_controller DUT (.clk(tbclk),.mode(tbmode),.lightout(tblightout));

initial #500 $finish;

initial begin #150 tbmode = 0;#130 tbmode =1;end

initial begin
    $dumpfile("traffic.vcd");
    $dumpvars;
    end
endmodule
