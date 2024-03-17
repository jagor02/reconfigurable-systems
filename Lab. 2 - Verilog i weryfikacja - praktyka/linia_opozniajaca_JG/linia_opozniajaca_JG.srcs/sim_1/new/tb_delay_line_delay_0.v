`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 18:35:06
// Design Name: 
// Module Name: tb_delay_line_delay_0
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


module tb_delay_line_delay_0 #
(
    parameter N=8 // szerokoœæ szyny danych
)
(
);

wire [N-1:0] odata; // wyjœcie

reg [N-1:0] idata; // wejœcie

reg clk=1'b0; // zegar
reg ce=1'b1; // w³¹czanie/wy³¹czanie rejestrów 'register'

integer i;
initial
begin
    for(i=0;i<N;i=i+1)
    begin
        if(i < N/2) idata[i]=0; // inicjalizacja wejœcia
        else idata[i]=1;
    end
    while(1)
    begin
       #1; clk=1'b0; // zegar
       #1; clk=1'b1;
    end
end

delay_line
#(
    .N(N),
    .DELAY(0)
)
dut
(
    .clk(clk),
    .ce(ce),
    .idata(idata),
    .odata(odata)
);

endmodule
