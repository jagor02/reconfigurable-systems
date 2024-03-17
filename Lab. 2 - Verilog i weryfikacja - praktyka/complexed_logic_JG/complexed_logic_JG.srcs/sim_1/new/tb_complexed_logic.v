`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 21:39:53
// Design Name: 
// Module Name: tb_complexed_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_complexed_logic
(
);

wire z;

// x
reg [7:0]x1=8'b10011111;
reg [7:0]x2=8'b01010101;
reg [7:0]x3=8'b11111111;
reg [7:0]x4=8'b00001111;
reg [7:0]x5=8'b11001100;
reg [7:0]x6=8'b00110011;
reg [7:0]x7=8'b00111100;
reg [7:0]x8=8'b10000000;

// y
reg [7:0]y1=8'b10010000;
reg [7:0]y2=8'b10101010;
reg [7:0]y3=8'b00000000;
reg [7:0]y4=8'b11110000;
reg [7:0]y5=8'b00110011;
reg [7:0]y6=8'b11111111;
reg [7:0]y7=8'b11000011;
reg [7:0]y8=8'b10000000;

complexed_logic dut
(
    .x(x1),
    .y(y1),
    .z(z)
);

endmodule
