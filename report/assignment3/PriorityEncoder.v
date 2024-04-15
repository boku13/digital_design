`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 12:25:40 PM
// Design Name: 
// Module Name: PriorityEncoder
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

module PriorityEncoder(
    input I3, I2, I1, I0,
    output reg Y1, Y0,
    output reg V
);

always @(I3, I2, I1, I0) begin
    casez({I3, I2, I1, I0})
        4'b1???: {V, Y1, Y0} = 3'b111; // I3 has the highest priority
        4'b01??: {V, Y1, Y0} = 3'b110; // I2 takes priority next
        4'b001?: {V, Y1, Y0} = 3'b101; // Then comes I1
        4'b0001: {V, Y1, Y0} = 3'b100; // I0 has the lowest priority and there's some input indicated by V.
        default: {V, Y1, Y0} = 3'b000; // No input is high but there's no input
    endcase
end

endmodule