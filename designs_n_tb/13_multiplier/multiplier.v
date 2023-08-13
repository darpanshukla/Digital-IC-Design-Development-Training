//`include "fivebitadder.v"

module multiplier(a,b,mulout,resulton,clk);
/* multiplication of five bit binary number */
input  [4:0]     a;
input  [4:0]     b;
input            clk;
output reg [9:0] mulout;
output reg       resulton;
reg    [5:0]     count;
reg    [5:0]     countbit;

initial begin
    count    = 5'b00000;
    countbit = 5'b00001;
    multout  = 10'b0;
end

always @( posedge clk ) begin
    resulton = 1'b0;
    while ( count != b ) begin
        fivebitadder fba1( count,       countbit, count,             );
        fivebitadder fba2( mulout[4:0], a,        mulout[4:0], carry );
        fivebitadder fba3( mulout[9:5], carry,    mulout[9:5],       );
    end
    resulton = 1'b1;
end
endmodule