`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 04:01:44 PM
// Design Name: 
// Module Name: register
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


module register #
(
    parameter N=8 // szerokoœæ szyny danych
)
(
    input clk, // zegar
    input ce, // w³¹czanie/wy³¹czanie rejestru 'register'
    input [N-1:0]d, // dane wejœciowe (N bitów)
    output [N-1:0]q // dane wyjœciowe (N bitów)
);

reg [N-1:0]val; // rejestr pomocniczy

// inicjalizacja rejestru 'val'
integer i;
initial
begin
    for(i=0;i<N;i=i+1)
    begin
        val[i]<=1'b0;
    end
end

// logika rejestru 'register'
always @(posedge clk)
begin
    if(ce) val<=d;
    else val<=val;
end

assign q=val;

endmodule
