`include "full_substractor.v"
module full_subtractor_tb();

reg tba, tbb, tbbin;
wire tbsubtr, tbbout;

full_substractor DUT(.a(tba),.b(tbb), .bin(tbbin), .subtr(tbsubtr),.bout(tbbout));

initial begin
    #80 $finish;
end
initial begin
    tba = 0; tbb = 0; tbbin = 0;
    #10
    tba = 0; tbb = 0; tbbin = 1;
    #10
    tba = 0; tbb = 1; tbbin = 0;
    #10
    tba = 0; tbb = 1; tbbin = 1;
    #10
    tba = 1; tbb = 0; tbbin = 0;
    #10
    tba = 1; tbb = 0; tbbin = 1;
    #10
    tba = 1; tbb = 1; tbbin = 0;
    #10
    tba = 1; tbb = 1; tbbin = 1;
end
initial begin
    $dumpfile("full_subtractor.vcd");
    $dumpvars;
end
endmodule