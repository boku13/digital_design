`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2024 11:16:05 AM
// Design Name: 
// Module Name: decimal_on_seven_seg
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

module binary_to_decimal(input [4:0] binary, output reg [4:0] decimal, output reg [3:0] dec_tens, output reg [3:0] dec_ones);
always @ (binary) 
begin
decimal = binary[4]*16 + binary[3]*8 + binary[2]*4 + binary[1]*2 + binary[0]*1;
dec_tens = decimal / 10;
dec_ones = decimal % 10;
end
endmodule


module full_adder(input A, input B, input Cin,  output S, output Cout);
assign {Cout, S} = A + B + Cin;
endmodule

module four_bit_adder(input [3:0] A, input [3:0] B, output [3:0] S, output Cout);
wire [3:0] C;
full_adder fa_one(A[0], B[0], 0,  S[0], C[0]);
full_adder fa_two(A[1], B[1], C[0], S[1], C[1]);
full_adder fa_three(A[2], B[2], C[1], S[2], C[2]);
full_adder fa_four(A[3], B[3], C[2], S[3], Cout);
endmodule

module bcd_to_seven_segment(input [3:0] A, output [6:0] Out);
//common cathode
assign Out[0] = (A[3] | A[1] | (A[2] & A[0]) | (~A[2] & ~A[0]));
assign Out[1] = (~A[2] | (~ A[1] & ~A[0]) | (A[1] & A[0]));
assign Out[2] = (A[2] | ~A[1] | A[0]) ;
assign Out[3] = (A[3] | (~A[2] & A[1]) | (~A[2] & ~A[0]) | (A[1] & ~A[0]) | (A[2] & ~A[1] & A[0]));
assign Out[4] = ((A[1] & ~A[0]) | (~A[2] & ~A[0]));
assign Out[5] = (A[3] | (~ A[1] & ~A[0]) | (A[2] & ~A[1]) | (A[2] & ~A[0]));
assign Out[6] = (A[3] | (A[2] & ~A[1]) | (~A[2] & A[1]) | (A[1] & ~A[0]));
//common anode simply add a ~ at the front.
endmodule

module display_adder(input [3:0] dec_tens, input [3:0] dec_ones, output [6:0] s_tens, output [6:0] s_ones);
bcd_to_seven_segment tens_(dec_tens, s_tens);
bcd_to_seven_segment ones_(dec_ones, s_ones);
endmodule

module adder_on_seven_seg(input [3:0] A,  input [3:0] B, output [6:0] SSD_tens, output [6:0] SSD_ones);
wire [3:0] s; wire c;
wire [3:0] dec, d_tens, d_ones;
four_bit_adder fourbitadder(A, B, s, c);
binary_to_decimal binarytodecimal({c, s}, dec, d_tens, d_ones);
display_adder decimalannotation(d_tens, d_ones, SSD_tens, SSD_ones);
endmodule
