`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 01:56:31 AM
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

module shifter(
    input clk,
    input reset,
    input [3:0] A,
    input [1:0] selection,
    output reg [5:0] shifted  // Corrected to use 6-bit output
);
    reg [5:0] register;  // Corrected internal register to 6 bits

    always @(posedge clk or posedge reset) begin
        if (reset)
            register <= 6'b000000;
        else begin
            case(selection)
                2'b00: register <= {2'b00, A};  // No shift, load A into the lower bits with 2-bit padding
                2'b01: register <= {1'b0, A, 1'b0};  // Shift left by 1
                2'b10: register <= {3'b000, A[3:1]};  // Corrected: Shift right by 1, MSB lost, LSB padded with 0
                2'b11: register <= {A, 2'b00};  // Shift left by 2
                default: register <= 6'b000000;
            endcase
        end
    end

    always @(register)
        shifted <= register;
endmodule



