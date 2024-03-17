`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 18:38:13
// Design Name: 
// Module Name: tb_delay_line_even_delay
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


module tb_delay_line_even_delay #
(
    parameter N=6 // szeroko�� szyny danych
)
(
);

wire [N-1:0] odata; // wyj�cie

reg [N-1:0] idata; // wej�cie

reg clk=1'b0; // zegar
reg ce=1'b1; // w��czanie/wy��czanie rejestr�w 'register'

integer i;
initial
begin
    for(i=0;i<N;i=i+1)
    begin
        if(i < N/2) idata[i]=0; // inicjalizacja wej�cia
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
    .DELAY(2)
)
dut
(
    .clk(clk),
    .ce(ce),
    .idata(idata),
    .odata(odata)
);

endmodule
