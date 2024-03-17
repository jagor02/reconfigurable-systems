`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2024 21:03:29
// Design Name: 
// Module Name: complexed_logic
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


module complexed_logic
(
    input [7:0] x,
    input [7:0] y,
    output z
);
    
wire [14:0]chain;

genvar i;
generate
    for (i=0;i<8;i=i+1)
    begin
        assign chain[i]=x[i]&y[i];
    end
    for (i=0;i<4;i=i+1)
    begin
        assign chain[i+8]=chain[2*i]|chain[2*i+1];
    end
    for (i=0;i<2;i=i+1)
    begin
        assign chain[i+12]=chain[2*i+8]&chain[2*i+9];
    end
    assign chain[14]=chain[12]|chain[13];
endgenerate
    
assign z=chain[14];    

endmodule
