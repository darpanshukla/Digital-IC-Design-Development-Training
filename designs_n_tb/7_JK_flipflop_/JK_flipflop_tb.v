`include "JK_flipflop.v"
module JK_flipflop_tb;

reg tbj, tbk, tbclk;

//wire tbyout;

always #11 tbclk = ~tbclk;

JK_flipflop DUT(.j(tbj), .k(tbk), .clk(tbclk), .yout(tbyout) );

initial
    #100
    $finish;
initial begin
    tbj = 0;
    tbclk = 0;
    forever 
        #20 
        tbj = ~tbj;
end
initial begin
    tbk = 0;
    forever
        #40 
        tbk = ~tbk;
end
initial begin
    $dumpfile("JK_flipflop.vcd");
    $dumpvars;
end
endmodule