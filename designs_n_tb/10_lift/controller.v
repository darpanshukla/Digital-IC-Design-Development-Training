module controller(
    // input from outside world
    input clk,
    // input floor request - Eleven floors
    input in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, 
    // input sensor signals
    input in_door_obstacle,
    // input from inside lift
    input in_door_open,
    input in_door_close,
    // input from timer
    input reached,

    // operation states
    output out_up_direction,
    output out_down_direction,
    output out_door_opening,
    output out_door_closing,
    output out_ready,

    // output to timer
    output integer current_state,
    output integer nfloor,
    output integer pfloor);
/*
This design module has two components
1. state transitions
2. scheduling of lift floor requests

*/

/*
reg out_door_opening;
reg out_door_closing;
reg out_up_direction;
reg out_down_direction;
reg out_ready;

reg current_state;*/
//reg integer pfloor;
//reg integer current_state;
//reg integer nfloor;
reg dir;// dir = 1 up direction, dir = 0 for down direction

parameter STATE_DOOR_OPEN  = 1;
parameter STATE_DOOR_CLOSE = 2;
parameter STATE_READY      = 3;
parameter STATE_MOVE_UP    = 4;
parameter STATE_MOVE_DOWN  = 5;

initial begin
dir           = 1;
current_state = STATE_READY;
pfloor        = 0;
nfloor        = 0;
end

// state transition (current_state)

always @(posedge clk)
    begin
    case (current_state)
        STATE_DOOR_OPEN:
            begin
            if  (in_door_obstacle | in_door_open)
                current_state = STATE_DOOR_OPEN;
            else 
                current_state = STATE_DOOR_CLOSE;
            end

        STATE_DOOR_CLOSE:
            begin
            if  (in_door_open)
                current_state = STATE_DOOR_OPEN;
            else
                current_state = STATE_READY;
            end

        STATE_READY:
            begin
            if      (in_door_open)
                    current_state = STATE_DOOR_OPEN;
            else if (pfloor < nfloor)
                    current_state = STATE_MOVE_UP;
            else if (pfloor > nfloor)
                    current_state = STATE_MOVE_DOWN;        
            else if (pfloor == nfloor)
                    current_state = STATE_READY; 
            else
                    current_state = STATE_READY;
            end  

        STATE_MOVE_UP:
            begin
            if (reached) 
                begin
                current_state = STATE_DOOR_OPEN;
                pfloor = nfloor;
                /*case (pfloor)
                    0:  in0  = 1'b0;
                    1:  in1  = 1'b0;
                    2:  in2  = 1'b0;
                    3:  in3  = 1'b0;
                    4:  in4  = 1'b0;
                    5:  in5  = 1'b0;
                    6:  in6  = 1'b0;
                    7:  in7  = 1'b0;
                    8:  in8  = 1'b0;
                    9:  in9  = 1'b0;
                    10: in10 = 1'b0;
                endcase*/
                end
            else
                current_state = STATE_MOVE_UP;
            end

        STATE_MOVE_DOWN:
            begin
            if (reached)
                begin
                current_state = STATE_DOOR_OPEN;
                pfloor = nfloor;
                /*case (pfloor)
                    0:  in0  = 1'b0;
                    1:  in1  = 1'b0;
                    2:  in2  = 1'b0;
                    3:  in3  = 1'b0;
                    4:  in4  = 1'b0;
                    5:  in5  = 1'b0;
                    6:  in6  = 1'b0;
                    7:  in7  = 1'b0;
                    8:  in8  = 1'b0;
                    9:  in9  = 1'b0;
                    10: in10 = 1'b0;
                endcase*/
                end
            else 
                current_state = STATE_MOVE_DOWN;
            end

        default: current_state = STATE_READY;
    endcase
end

// next floor decision making algorithm
always @(posedge clk)
    begin
    // scanning input requests for the all the ten floors
/*    if (in0)  in0  = 1;
    if (in1)  in1  = 1;
    if (in2)  in2  = 1;
    if (in3)  in3  = 1;
    if (in4)  in4  = 1;
    if (in5)  in5  = 1;
    if (in6)  in6  = 1;
    if (in7)  in7  = 1;
    if (in8)  in8  = 1;
    if (in9)  in9  = 1;
    if (in10) in10 = 1;
*/
    if (dir)
        begin
            case (pfloor)
            0:  begin
                     if (in1)  nfloor = 1;
                else if (in2)  nfloor = 2;
                else if (in3)  nfloor = 3;
                else if (in4)  nfloor = 4;
                else if (in5)  nfloor = 5;
                else if (in6)  nfloor = 6;
                else if (in7)  nfloor = 7;
                else if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else           nfloor = pfloor;
                end
            1:  begin
                     if (in2)  nfloor = 2;
                else if (in3)  nfloor = 3;
                else if (in4)  nfloor = 4;
                else if (in5)  nfloor = 5;
                else if (in6)  nfloor = 6;
                else if (in7)  nfloor = 7;
                else if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0)  dir = 0;
                else           nfloor = pfloor;
                end
            2:  begin
                     if (in3)  nfloor = 3;
                else if (in4)  nfloor = 4;
                else if (in5)  nfloor = 5;
                else if (in6)  nfloor = 6;
                else if (in7)  nfloor = 7;
                else if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0 | in1) dir = 0;
                else           nfloor = pfloor;
                end
            3:  begin
                     if (in4)  nfloor = 4;
                else if (in5)  nfloor = 5;
                else if (in6)  nfloor = 6;
                else if (in7)  nfloor = 7;
                else if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0 | in1 | in2) dir = 0;
                else           nfloor = pfloor;
                end
            4:  begin
                     if (in5)  nfloor = 5;
                else if (in6)  nfloor = 6;
                else if (in7)  nfloor = 7;
                else if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0 | in1 | in2 | in3) dir = 0;
                else           nfloor = pfloor;
                end
            5:  begin
                     if (in6)  nfloor = 6;
                else if (in7)  nfloor = 7;
                else if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0 | in1 | in2 | in3 | in4) dir = 0;
                else           nfloor = pfloor;
                end
            6:  begin
                     if (in7)  nfloor = 7;
                else if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0 | in1 | in2 | in3 | in4 | in5) dir = 0;
                else           nfloor = pfloor;
                end
            7:  begin
                     if (in8)  nfloor = 8;
                else if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0 | in1 | in2 | in3 | in4 | in5 | in6) dir = 0;
                else           nfloor = pfloor;
                end
            8:  begin
                     if (in9)  nfloor = 9;
                else if (in10) nfloor = 10;
                else if (in0 | in1 | in2 | in3 | in4 | in5 | in6 | in7) dir = 0;
                else           nfloor = pfloor;
                end
            9:  begin
                     if (in10) nfloor = 10;
                else if (in0 | in1 | in2 | in3 | in4 | in5 | in6 | in7 | in8) dir = 0;
                else           nfloor = pfloor;
                end
            10:      dir = 0;
            endcase
        end
    else if (~dir)
        begin
            case (pfloor)
            0: dir = 1;
            
            1:  begin
                     if (in0) nfloor = 0;
                else if (in2 | in3 | in4 | in5 | in6 | in7 | in8 | in9 | in10 ) dir = 1;
                else          nfloor = pfloor;
                end
            
            2:  begin
                     if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in3 | in4 | in5 | in6 | in7 | in8 | in9 | in10 ) dir = 1;
                else          nfloor = pfloor;
                end
            
            3:  begin
                     if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in4 | in5 | in6 | in7 | in8 | in9 | in10 ) dir = 1;
                else          nfloor = pfloor;
                end
            
            4:  begin
                     if (in3) nfloor = 3;
                else if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in5 | in6 | in7 | in8 | in9 | in10 ) dir = 1;
                else          nfloor = pfloor;
                end

            5:  begin
                     if (in4) nfloor = 4;
                else if (in3) nfloor = 3;
                else if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in6 | in7 | in8 | in9 | in10 ) dir = 1;
                else          nfloor = pfloor;
                end

            6:  begin
                     if (in5) nfloor = 5;
                else if (in4) nfloor = 4;
                else if (in3) nfloor = 3;
                else if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in7 | in8 | in9 | in10 ) dir = 1;
                else          nfloor = pfloor;
                end
            
            7:  begin
                     if (in6) nfloor = 6;
                else if (in5) nfloor = 5;
                else if (in4) nfloor = 4;
                else if (in3) nfloor = 3;
                else if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in8 | in9 | in10 ) dir = 1;
                else          nfloor = pfloor;
                end

            8:  begin
                     if (in7) nfloor = 7;
                else if (in6) nfloor = 6;
                else if (in5) nfloor = 5;
                else if (in4) nfloor = 4;
                else if (in3) nfloor = 3;
                else if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in9 | in10) dir = 1;
                else          nfloor = pfloor;
                end

            9:  begin
                     if (in8) nfloor = 8;
                else if (in7) nfloor = 7;
                else if (in6) nfloor = 6;
                else if (in5) nfloor = 5;
                else if (in4) nfloor = 4;
                else if (in3) nfloor = 3;
                else if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else if (in10) dir   = 1;
                else          nfloor = pfloor;
                end

            10: begin
                     if (in9) nfloor = 9;
                else if (in8) nfloor = 8;
                else if (in7) nfloor = 7;
                else if (in6) nfloor = 6;
                else if (in5) nfloor = 5;
                else if (in4) nfloor = 4;
                else if (in3) nfloor = 3;
                else if (in2) nfloor = 2;     
                else if (in1) nfloor = 1;
                else if (in0) nfloor = 0;
                else          nfloor = pfloor;
            end
            endcase

        end
end

// output signals
//assign current_state             = current_state;
assign out_door_closing   = (current_state == STATE_DOOR_CLOSE)?1:0;
assign out_door_opening   = (current_state == STATE_DOOR_OPEN)?1:0;
assign out_down_direction = (current_state == STATE_MOVE_DOWN)?1:0;
assign out_up_direction   = (current_state == STATE_MOVE_UP)?1:0;
assign out_ready          = (current_state == STATE_READY)?1:0;

endmodule