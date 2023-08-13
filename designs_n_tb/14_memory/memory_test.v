`include "memory_design.v"
module memory_test();

reg clk,reset,control;

reg address;
reg [0:7] write_data;
wire [0:7] read_data;

memory_design memcall(
.clk(clk),
.reset(reset),
.write_enable(control),
.read_data(read_data),
.write_data(write_data),
.address(address)
);

initial clk = 1'b0;
always #5 clk = ~clk;

initial #500 $finish;

initial begin
    $dumpfile("memory.vcd");
    $dumpvars;
end

initial reset = 1'b0;

initial begin

#50
control    = 1'b0;//read
reset      = 1'b0;
address    = 1000;

#100
control    = 1'b1;//write
write_data = 8'b00001111;

#100
control    = 1'b0;//read

#100
control    = 1'b1;//write
write_data = 8'b11111111;

end
endmodule