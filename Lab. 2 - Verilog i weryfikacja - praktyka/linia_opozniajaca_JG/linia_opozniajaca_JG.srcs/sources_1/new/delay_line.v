`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 04:03:52 PM
// Design Name: 
// Module Name: delay_line
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


module delay_line #
(
    parameter N=8, // szeroko�� szyny danych
    parameter DELAY=4 // d�ugo�� op�nienia
)
(
    input clk, // zegar
    input ce, // w��czanie/wy��czanie rejestr�w 'register'
    input [N-1:0] idata, // dane wej�ciowe (N bit�w)
    output [N-1:0] odata // dane wyj�ciowe (N bit�w)
);

wire [N-1:0] tdata [DELAY:0]; // po��czenia mi�dzy pojedynczymi rejestrami 'register'

genvar i;
generate
    if(DELAY==0) // brak op�nienia
    begin
        assign odata=idata;
    end else // op�nienie o d�ugo�ci DELAY
    begin
        assign tdata[0]=idata;
        for(i=0;i<DELAY;i=i+1)
        begin
            register
            #(
                .N(N)
            )
            regi
            (
                .clk(clk),
                .ce(ce),
                .d(tdata[i]),
                .q(tdata[i+1])
            );
        end
        assign odata=tdata[DELAY];
    end
endgenerate
endmodule
