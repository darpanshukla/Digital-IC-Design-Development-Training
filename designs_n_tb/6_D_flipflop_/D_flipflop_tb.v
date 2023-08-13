`include "D_flipflop.v"
module D_flipflop_tb;

reg tbdin, tbclk;
wire tbdout;

always #11 tbclk = ~tbclk;

D_flipflop DUT( .din(tbdin), .clk(tbclk), .dout(tbdout));

initial 
    #70
    $finish;


initial begin
    tbclk = 0;
    tbdin = 0;
    forever 
        #20
        tbdin = ~tbdin;
end

initial begin
    $dumpfile("D_flipflop.vcd");
    $dumpvars;
end

endmodule