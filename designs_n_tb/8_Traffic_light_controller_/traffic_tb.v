`include "traffic.v"
module traffic_light_controller_tb();

reg tbclk, tbmode;

wire tblightout;

always #10 tbclk = ~tbclk;

traffic_light_controller DUT (.clk(tbclk),.mode(tbmode),.lightout(tblightout));


initial #300 $finish;

initial begin
    $dumpfile("traffic.vcd");
    $dumpvars;
    $monitor($time,tbclk,tblightout);

    end
endmodule
