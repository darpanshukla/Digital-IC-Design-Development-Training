`include "controller.v"
`include "timer.v"
module Microcontroller_lift(
    input clk,
    input in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,
    input in_door_obstacle,
    input in_door_open,
    input in_door_close,

    output out_up_direction,
    output out_down_direction,
    output out_door_opening,
    output out_door_closing,
    output out_ready);

wire reached;
wire integer current_state;
wire integer nfloor;
wire integer pfloor;

controller cu(
    //input
    .clk(clk),
    .in0(in0), .in1(in1), .in2(in2), .in3(in3),
    .in4(in4), .in5(in5), .in6(in6), .in7(in7),
    .in8(in8), .in9(in9), .in10(in10),

    .in_door_obstacle(in_door_obstacle),
    .in_door_open(in_door_open),
    .in_door_close(in_door_close),

    .reached(reached),
    .out_up_direction(out_up_direction),
    .out_down_direction(out_down_direction),
    .out_door_opening(out_door_opening),
    .out_door_closing(out_door_closing),
    .out_ready,
    .current_state(current_state),
    .nfloor(nfloor),
    .pfloor(pfloor)
);

timer ti(
    //input
    .clk(clk),
    .current_state(current_state),
    .nfloor(nfloor),
    .pfloor(pfloor),
    //output
    .reached(reached)
);

endmodule