module traffic_light_controller( input clk, mode, output reg [11:0] lightout);
// lightout has 12 bits output describing, north (MSB), east, south, west 
// each three bits in order, green, yellow, red, for north green signal: 4111 is output in octal
parameter   lightout_ng = 12'b100_001_001_001,// n green remaining red 4111 in octal
            lightout_ny = 12'b010_001_001_010,// n and w yellow: 2112
            lightout_wg = 12'b001_001_001_100,// w green       : 1114
            lightout_wy = 12'b001_010_001_010,// w and e yellow: 1212
            lightout_eg = 12'b001_100_001_001,// e green       : 1411
            lightout_ey = 12'b001_010_010_001,// e and s yellow: 1221
            lightout_sg = 12'b001_001_100_001,// s green       : 1121
            lightout_sy = 12'b010_001_010_001;// s and n yellow: 2121

reg real    timer1      = 50;// 50 seconds green light time //reg real    timer2      = 30;// 30 seconds green light for minor traffic
reg real    timer3      = 10;// 10 seconds yellow light time
reg real    start_timer, elapsed_time, timer, next_timer;// start the cycle from NORTH
reg integer flag, next_flag;// flag = 1 for green, flag = 2 for yellow,
reg [11:0] next_lightout;

initial begin
    timer        = timer1;
    next_timer   = timer3;
    lightout     = lightout_ng;
    next_lightout= lightout_ny;
    start_timer  = $time;
end

always @(posedge clk)
begin 
    elapsed_time = $time - start_timer;
    if (elapsed_time >= timer)
        begin
            lightout    = next_lightout;
            timer       = next_timer;
            start_timer = $time;
            case (next_timer)
                timer1: next_timer  = timer3;
                timer3: next_timer  = timer1;
            endcase
            case (next_lightout)
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
end
endmodule