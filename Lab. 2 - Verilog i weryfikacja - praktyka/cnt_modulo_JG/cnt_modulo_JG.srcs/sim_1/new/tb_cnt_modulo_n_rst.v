`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 19:57:43
// Design Name: 
// Module Name: tb_cnt_modulo_n_rst
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


module tb_cnt_modulo_n_rst
(
 );

localparam N = 8; // wartoœæ, do której zlicza licznik
localparam WIDTH=$clog2(N); // iloœæ bitów potrzebna do zapisania liczby N

wire [WIDTH-1:0]y; // wyjœcie
 
reg clk=1'b0; // zegar
reg ce=1'b1; // w³¹czenie/wy³¹czenie zliczania
reg rst=1'b0; // reset

initial
begin
    while(1)
    begin
        #1; clk<=1'b0; // zegar
        #1; clk<=1'b1;
        if (y==5) rst<=1'b1; //reset
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
