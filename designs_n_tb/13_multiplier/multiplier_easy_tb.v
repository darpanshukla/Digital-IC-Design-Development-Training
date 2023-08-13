`include "multiplier_easy.v"
module multiplier_easy_tb();

reg real tba,tbb,tbclk;
wire real tbyout;

multiplier_easy mle(.a(tba), .b(tbb), .yout(tbyout));

initial #100 $finish;

initial begin 
    #20 tba = 20;
        tbb = 2;
end

initial begin
    $dumpfile("multiplier_.vcd");
    $dumpvars;
end

endmodule