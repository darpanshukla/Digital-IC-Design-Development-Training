`include "baud_rate_generator.v"
module baud_tester();

reg tbclk, tbstart, tbrx;
reg [31:0] tbdivisor;

reg tbareset;
wire tbout;

initial #1000 $finish;

baud_rate_gen bd(
    tbclk, 
    tbstart,
    tbrx,
    tbdivisor,
    tbareset,
    tbout
);

initial tbclk =  1'b0;
always #1 tbclk = ~tbclk;

initial begin
    tbstart = 1;
    tbdivisor = 100;
    tbareset = 1;
    #10 tbareset = 0;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
end
endmodule