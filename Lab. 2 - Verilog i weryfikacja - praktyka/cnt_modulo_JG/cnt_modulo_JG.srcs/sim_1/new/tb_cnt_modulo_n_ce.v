`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 19:44:59
// Design Name: 
// Module Name: tb_cnt_modulo_n_ce
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


module tb_cnt_modulo_n_ce
(
 );

localparam N = 8; // wartoœæ, do której zlicza licznik
localparam WIDTH=$clog2(N); // iloœæ bitów potrzebna do zapisania liczby N

wire [WIDTH-1:0]y; // wyjœcie
 
reg clk=1'b0; // zegar
reg ce=1'b1; // w³¹czenie/wy³¹czenie zliczania
reg rst=1'b0; // reset
reg flag=1'b0; // pomocnicza flaga

initial
begin
    while(1)
    begin
        #1; clk<=1'b0; // zegar
        #1; clk<=1'b1;
        if (y==5) ce<=1'b0; //pauza
    end
end

cnt_modulo_n #
(
    .N(N)
)
dut
(
    .clk(clk),
    .ce(ce),
    .rst(rst),
    .y(y)
);

endmodule
