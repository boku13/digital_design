`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 11:17:29 AM
// Design Name: 
// Module Name: shifter
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

module mux(input [3:0] A, input [1:0] selection, output reg [5:0] shifted);
always@(selection, A)
begin 
    case(selection)
        2'b00: shifted = A;
        2'b01: shifted = A << 1;
        2'b10: shifted = A >> 1;
        2'b11: shifted = A << 2;
        default: shifted = 4'b0000;
    endcase
end
endmodule
