`include "lift_controller.v"
module lift_controller_tb();

reg clk;
reg in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10;
reg in_door_obstacle;
reg in_door_open;
reg in_door_close;

wire out_up_direction;
wire out_down_direction;
wire out_door_opening;
wire out_door_closing;
wire out_ready;


initial begin
    clk = 1'b0;

    in0 = 1'b0;
    in1 = 1'b0;
    in2 = 1'b0;
    in3 = 1'b0;
    in4 = 1'b0;
    in5 = 1'b0;
    in6 = 1'b0;
    in7 = 1'b0;
    in8 = 1'b0;
    in9 = 1'b0;
    in10 = 1'b0;

    in_door_obstacle = 1'b0;
    in_door_open = 1'b0;
    in_door_close = 1'b0;
end

initial #600 $finish;
always #10 clk = ~clk;

initial begin

    #20
    in4 = 1'b1;
    #160
    in8 = 1'b1;
    #50
    in0 = 1'b1;
end

Microcontroller_lift ucl(  
    clk,
    in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,
    in_door_obstacle,
    in_door_open,
    in_door_close,
    out_up_direction,
    out_down_direction,
    out_door_opening,
    out_door_closing,
    out_ready);

initial begin
    $dumpfile("lift_controller.vcd");
    $dumpvars;
end
endmodule