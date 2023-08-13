module counter(count,clk);

output integer count;
input clk;

always @(posedge clk ) begin
    count = count + 1;
    $display($time);
end

always @(negedge clk ) begin
    count = count + 1;
end

initial begin
    count = 0;
end

endmodule