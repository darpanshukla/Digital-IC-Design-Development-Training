module half_substractor(a,b,subtr,carry);
/* perform subtr = b - a */
input a,b;//
output subtr,carry;
xor (subtr,  a, b);
and (carry, ~b, a);

endmodule