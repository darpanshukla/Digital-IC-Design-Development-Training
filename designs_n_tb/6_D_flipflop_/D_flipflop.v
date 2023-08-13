module D_flipflop( input din, clk, output reg dout );
//reg dout;
always @ (posedge clk)
dout = din;

endmodule