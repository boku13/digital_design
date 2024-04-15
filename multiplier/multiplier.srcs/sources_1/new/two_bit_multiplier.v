`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 02:18:57 PM
// Design Name: 
// Module Name: two_bit_multiplier
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

module half_adder(input A, input B, output sum, output carry);
assign {carry, sum} = A + B;
//assign sum = A ^ B;
//assign carry = A & B;
endmodule

module two_bit_multiplier(input [1:0] A, input [1:0] B, output [3:0] P);
wire c1, c2;
assign P[0] = A[0]&B[0];
half_adder ha1((A[0]&B[1]), (A[1]&B[0]) , P[1], c1);
half_adder ha2((A[1]&B[1]), c1, P[2], P[3]);
endmodule
