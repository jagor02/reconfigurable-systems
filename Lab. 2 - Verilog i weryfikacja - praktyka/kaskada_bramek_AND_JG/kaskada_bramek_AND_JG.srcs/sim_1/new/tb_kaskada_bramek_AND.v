`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 03:40:59 PM
// Design Name: 
// Module Name: tb_kaskada_bramek_AND
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


module tb_kaskada_bramek_AND
(
);

localparam LENGTH=8; // iloœæ wejœæ

wire y; // wyjœcie

reg clk=1'b0; // zegar
reg [LENGTH-1:0]cnt;

integer i;

initial
begin
    for(i=0;i<LENGTH;i=i+1)
    begin
        cnt[i]<=1'b0; // inicjalizacja cnt
    end
    while(1)
    begin
        #1; clk=1'b0; // dzia³anie zegara
        #1; clk=1'b1;
    end
end

always @(posedge clk)
begin
    cnt<=cnt+1;
end

kaskada_bramek_AND
#(
    .LENGTH(LENGTH)
)
dut
(
    .x(cnt),
    .y(y)
);
endmodule
