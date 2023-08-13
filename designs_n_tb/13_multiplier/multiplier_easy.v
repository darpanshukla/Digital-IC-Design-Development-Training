module multiplier_easy(a,b,yout,resultout,clk);

input real a,b;
input clk;
output real yout;
output resultout;

assign yout = a*b;

endmodule