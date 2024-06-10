`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 03:20:49 PM
// Design Name: 
// Module Name: four_bit_adder_subtractor
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

module four_bit_adder_subtractor(a, b, M, out);
input [3:0] a, b;
input M;
output [4:0] out;
wire c1, c2, c3, c4;
full_adder fa0(a[0], b[0], M, out[0], c1);
full_adder fa1(a[1], b[1], c1, out[1], c2);
full_adder fa2(a[2], b[2], c2, out[2], c3);
full_adder fa3(a[3], b[3], c3, out[3], out[4]);

endmodule