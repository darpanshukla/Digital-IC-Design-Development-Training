module traffic_light_controller( input clk, mode, output reg [11:0] lightout);
// lightout has 12 bits output describing, north, east, south, west 
// each three bits in order, green, yellow, red
parameter   lightout_ng = 12'b100001001001,// n green remaining red
            lightout_ny = 12'b010001001010,// n and w yellow
            lightout_wg = 12'b001001001100,// w green 
            lightout_wy = 12'b001010001010,// w and e yellow
            lightout_eg = 12'b001100001001,// e green
            lightout_ey = 12'b001010010001,// e and s yellow
            lightout_sg = 12'b001001100001,// s green
            lightout_sy = 12'b010001010001,// s and n yellow
            timerc      = 240;// major incoming traffic

reg real    timer1      = timerc/4;// green light time
reg real    timer2      = timer1/2;// Yellow light time
reg real    timer3      = timer1/10;// yellow light time
reg real    start_timer;// start the cycle from NORTH

reg integer flag = 1;// flag = 1 for green, flag = 2 for yellow,

initial begin
    start_timer  = 0;
    lightout     = lightout_ng;
end

always begin
    if (($time - start_timer) < timer1 ) && flag == 1
        lightout   <= lightout;
    else if (($time - start_timer) => timer1) && flag == 1 begin
        lightout   <= next_lightout;
        flag        = 2;
        start_timer = 0;
    end
    else if (($time - start_timer) < timer3 ) && flag = 2
        lightout   <= lightout;
    else if (($time - start_timer) => timer3) && flag == 2 begin
        lightout   <= next_lightout;
        flag        = 1;
        start_timer = 0;
    end    
end

always begin
case (lightout)
lightout_ng: next_lightout = lightout_ny;
lightout_ny: next_lightout = lightout_wg;
lightout_wg: next_lightout = lightout_wy;
lightout_wy: next_lightout = lightout_eg;
lightout_eg: next_lightout = lightout_ey;
lightout_ey: next_lightout = lightout_sg;
lightout_sg: next_lightout = lightout_sy;
lightout_sy: next_lightout = lightout_ng;
default:     next_lightout = lightout_ng;
endcase
end

endmodule