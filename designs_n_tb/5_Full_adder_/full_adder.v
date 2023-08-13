module full_adder(input a, b, cin, output sum, cout);

//input a,b,cin;
//output sum, cout;

//reg cout1, cout2, cout3;
	//assign cout1 = a & b;
	//assign cout2 = a & cin;
	//assign cout3 = b & cin;
	assign cout = (a&b) | (a&cin) | (b&cin);

	assign sum = a ^ b ^ cin;

endmodule
