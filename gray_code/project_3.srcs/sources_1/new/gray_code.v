`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 11:11:42 PM
// Design Name: 
// Module Name: gray_code
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

module graycode(input [3:0] A, output [3:0] B);
assign B[3] = A[3];
assign B[2] = A[2]^A[3];
assign B[1] = A[2]^A[1];
assign B[0] = A[0]^A[1];
endmodule

//module gray_test;
//reg [3:0] A;
//wire [3:0] B;
//graycode CODE(A, B);
////Test Cases
//initial begin
//A = 4'b0000; #10;
//A = 4'b0001; #10;
//A = 4'b0010; #10;
//A = 4'b0011; #10;
//A = 4'b0100; #10;
//A = 4'b0101; #10;
//A = 4'b0110; #10;
//A = 4'b0111; #10;
//A = 4'b1000; #10;
//$finish;
//end
//endmodule