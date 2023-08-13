`include "half_substractor.v"
module half_subtractor_tb();

reg tba, tbb;
wire tbsubtr, tbcarry;

half_substractor DUT(.a(tba),.b(tbb), .subtr(tbsubtr),.carry(tbcarry));

initial begin
    #40 $finish;
end
initial begin
    tba = 0; tbb = 0;
    #10
    tba = 0; tbb = 1;
    #10
    tba = 1; tbb = 0;
    #10
    tba = 1; tbb = 1;
end
initial begin
    $dumpfile("half_subtractor.vcd");
    $dumpvars;
end
endmodule