`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 00:13:20
// Design Name: 
// Module Name: kaskada_bramek_AND
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


module kaskada_bramek_AND #
(
    parameter LENGTH=8 // iloœæ wejœæ
)
(
    input [LENGTH-1:0]x, // wejœcia
    output y //wyjscie
);

wire [LENGTH:0] chain;
assign chain[0]=1'b1;

genvar i;
generate
    for(i=0;i<LENGTH;i=i+1)
    begin
        assign chain[i+1]=x[i]&chain[i]; // generacja 2-wejœciowych bramek AND i ich po³¹czeñ
    end
endgenerate
assign y=chain[LENGTH];
endmodule
