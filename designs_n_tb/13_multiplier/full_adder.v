module full_adder(a, b, cin, sum, cout);
input  a,   b,   cin;
output reg sum, cout;
assign cout = (a&b) | (a&cin) | (b&cin);
assign sum = a ^ b ^ cin;
endmodule
