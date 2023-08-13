module timer(
    //system input
    input clk,
    //module input
    input [31:0] current_state,
    input [31:0] nfloor,
    input [31:0] pfloor,

    output reached);
/*
This design module is monitors the time of moving the lift up or down. 
It takes as input 
1. clock, 
2. present state of lift
3. present floor
4. next floor

and generates binary output
1. reached = 0 for not reached and = 1 for reached

This program is implemented in two always block
1. with continuous block
2. with positive clock edge
*/
parameter STATE_DOOR_OPEN  = 1;
parameter STATE_DOOR_CLOSE = 2;
parameter STATE_READY      = 3;
parameter STATE_MOVE_UP    = 4;
parameter STATE_MOVE_DOWN  = 5;

reg reached;
reg flag;
integer counter;
integer targetcount;
integer speed = 1;// number of clock cycles for one floor travel
initial flag = 1;

always @(posedge clk)
    begin
        if ((current_state == STATE_MOVE_DOWN) | (current_state == STATE_MOVE_UP))
            begin
            if (flag == 1)
                begin
                    counter  = 1;
                    flag     = 0;
                    reached  = 0;
                    if (pfloor > nfloor)      targetcount = (pfloor - nfloor) * speed;
                    else if (pfloor < nfloor) targetcount = (nfloor - pfloor) * speed;
                end
            
            else if (flag == 0) 
                begin
                    counter = counter + 1;
                    if (counter == targetcount) 
                        begin
                        reached = 1;
                        flag    = 1;
                        counter = 1;
                        #(speed+4)
                        reached = 0;
                        end
                end
            end        
    end


/*
always 
    begin
        if ((current_state == STATE_MOVE_DOWN) | (current_state == STATE_MOVE_UP))
            begin
                if (nfloor == pfloor)
                    reached = 1;
                else
                    reached = 0;
            end
        else
            reached = 0;
    end
*/
endmodule