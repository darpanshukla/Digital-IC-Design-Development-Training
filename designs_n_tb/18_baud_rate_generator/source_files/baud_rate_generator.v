module baud_rate_generator(
    input wire clk,
    input wire rst,
    output wire baud_clk
);

parameter BAUD_RATE = 9600; // Replace with desired baud rate
reg [15:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 0;
    else if (counter == BAUD_RATE / 2 - 1)
        counter <= 0;
    else
        counter <= counter + 1;
end

assign baud_clk = counter == (BAUD_RATE / 2 - 1);

endmodule
