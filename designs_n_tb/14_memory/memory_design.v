module memory_design(clk,reset,write_enable,read_data,write_data,address);

input clk, reset, write_enable;
input address;
input [0:7] write_data;

output [0:7] read_data;

// Definition of memory cells 2 Kilo Byte
reg [0:7] sram [0:2047];


// storing of data in a memory address

//initial sram[1000] = 8'b00000011; 

// operation read or write
always @(posedge clk) begin
    if (write_enable) sram[address] = write_data;
end

assign read_data = sram[address];
endmodule