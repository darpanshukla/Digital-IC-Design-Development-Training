`include "counter.v"

module counter_tb;

reg tbclk;
wire [31:0] tbcount;

counter DUT( .count(tbcount), .clk(tbclk));

always #10 tbclk = ~tbclk;

initial #100000 $finish;

initial begin
    tbclk = 1'b0;
    $monitor($time, "\tCount=\t%d",tbcount);
    end

endmodule