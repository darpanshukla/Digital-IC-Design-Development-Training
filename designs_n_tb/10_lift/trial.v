module trial();

reg a = 0;
reg b = 4;
reg c = 0;
reg e = 1;
reg f = 3;
wire d;
assign d = c?a:(e==1?f:b);
always #10 $display(d,e==1); 

always #50 $finish;

endmodule