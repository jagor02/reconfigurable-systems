`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 18:54:28
// Design Name: 
// Module Name: cnt_modulo_n
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


module cnt_modulo_n #
(
    parameter N=8, // wartoœæ, do której zlicza licznik
    parameter WIDTH=$clog2(N) // iloœæ bitów potrzebna do zapisania liczby N
)
(
    input clk, // zegar
    input ce, // w³¹czanie/wy³¹czanie zliczania
    input rst, // reset
    output [WIDTH-1:0]y // wyjœcie
);

reg [WIDTH-1:0]val=0; // rejestr pomocniczy

always @(posedge clk)
begin
    if(rst || val==N-1) val<=0; // resetowanie rejestru (sygna³ rst lub osi¹gniêcie N)
    else
        if(ce) val<=val+1; // zliczania
        else val<=val;
end

assign y=val;

endmodule
