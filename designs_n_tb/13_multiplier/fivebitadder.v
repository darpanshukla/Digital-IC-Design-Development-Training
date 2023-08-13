//`include "full_adder.v"

module fivebitadder( a, b, sum, cout);
input  [4:0] a, b;
output [4:0] sum,cout;
wire fasum1,fasum2,fasum3,fasum4,fasum5;
wire facout1,facout2,facout3,facout4,facout5;

initial begin
    /*
    fasum1  = 1'b0;
    fasum2  = 1'b0;
    fasum3  = 1'b0;
    fasum4  = 1'b0;
    fasum5  = 1'b0;
    facout1 = 1'b0;
    facout2 = 1'b0;
    facout3 = 1'b0;
    facout4 = 1'b0;
    facout5 = 1'b0;*/

    full_adder fa1( a[0], b[0], 1'b0,    fasum1, facout1 );
    full_adder fa2( a[1], b[1], facout1, fasum2, facout2 );
    full_adder fa3( a[2], b[2], facout2, fasum3, facout3 );
    full_adder fa4( a[3], b[3], facout3, fasum4, facout4 );
    full_adder fa5( a[4], b[4], facout4, fasum5, facout5 );
    sum  = {fasum5,fasum4,fasum3,fasum2,fasum1};
    cout = {0,0,0,0,facout5};
end
endmodule
