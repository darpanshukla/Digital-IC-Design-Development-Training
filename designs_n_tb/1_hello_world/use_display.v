module use_display;
// use of display of hello verilog world
// iverilog use_display.v
// vvp a.out

// if used:
// iverilog -o disp use_display.v
// vvp disp.out
initial
$display("Hello verilog world");

endmodule