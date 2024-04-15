`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2024 12:41:35 PM
// Design Name: 
// Module Name: testbench_display_adder
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


module testbench_display_adder;
reg [3:0] A, B;
wire [3:0] sum;
wire Cout;
wire [4:0] decimal;  
//size 4 since max number that can be stored is 15
wire [3:0] d_tens, d_ones;
wire [6:0] seg_tens, seg_ones;

four_bit_adder FBADDER(A, B, sum, Cout);
binary_to_decimal BTOD({Cout, sum}, decimal, d_tens, d_ones);
display_adder DA(d_tens, d_ones, seg_tens, seg_ones);

//Test Cases
initial begin

//Test Case 1: 3 + 5 = 8
A = 4'b0011; B = 4'b0101; #20;

//Test Case 2: 12 + 10 = 22
A = 4'b1100; B = 4'b1010; #20;

//Test Case 3: 7 + 9 = 16
A = 4'b0111; B = 4'b1001; #20;

//Test Case 4: 15 + 3 = 18
A = 4'b1111; B = 4'b0011; #20;

//Test Case 5: 8 + 7 = 15
A = 4'b1000; B = 4'b0111; #20;

//Test Case 6: 15 + 15 = 30
A = 4'b1111; B = 4'b1111; #20;

//Test Case 7: 2 + 2 = 4
A = 4'b0001; B = 4'b0001; #20;

//Test Case 8: 5 + 5 = 10
A = 4'b1010; B = 4'b0101; #20;

//Test Case 9: 7 + 7 = 14
A = 4'b0111; B = 4'b0111; #20;

$finish;
end

endmodule
