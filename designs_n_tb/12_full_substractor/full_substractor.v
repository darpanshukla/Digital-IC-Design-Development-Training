module full_substractor(a,b,bin,subtr,bout);

input a,b,bin;
output subtr,bout;

assign subtr = a ^ b ^ bin;
assign bout  = (~a & bin ) | ( (a ~^ bin) & b );


endmodule