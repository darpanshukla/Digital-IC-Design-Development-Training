//`include "multiplier.v"
module multiplier_tb();

reg [4:0] tba;
reg [4:0] tbb;

wire [9:0] tbmult;
wire muloutput;

initial #400 $finish;

initial begin #50
    tba = 5'b11111;
    tbb = 5'b00001;
end

initial begin
    $dumpfile("multiplier.vcd");
    $dumpvars;
end

endmodule