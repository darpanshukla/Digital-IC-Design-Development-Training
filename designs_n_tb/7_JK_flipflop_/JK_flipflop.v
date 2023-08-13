module JK_flipflop(input j,k,clk,output yout);

reg yout;

always @ (posedge clk)
case({j,k})
2'b00 : yout <= yout;
2'b01 : yout <= 0;
2'b10 : yout <= 1;
2'b11 : yout <= ~yout;
endcase

endmodule