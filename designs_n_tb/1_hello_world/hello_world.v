module use_display;
// use of display of hello verilog world
// iverilog hello_world.v
// vvp a.out

// if used:
// iverilog -o disp hello_world.v
// vvp disp.out
initial
$display("Hello verilog world");

endmodule
