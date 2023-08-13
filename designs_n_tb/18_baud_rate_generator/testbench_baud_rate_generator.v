`include "baud_rate_generator.v"
module testbench_baud_rate_generator;

reg clk;
reg rst;
wire baud_clk;

// Instantiate the Baud Rate Generator module
baud_rate_generator DUT (
    .clk(clk),
    .rst(rst),
    .baud_clk(baud_clk)
);

// Clock generation for simulation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset generation
initial begin
    rst = 1;
    #10 rst = 0;
    #100 rst = 1;
    #10000 $finish; // End simulation after a while
end

// Monitor the baud_clk signal
always @(posedge clk) begin
    if (baud_clk)
        $display("Baud Clock: %t", $time);
end

initial begin
    $dumpfile("baud.vcd");
    $dumpvars;
end

endmodule
