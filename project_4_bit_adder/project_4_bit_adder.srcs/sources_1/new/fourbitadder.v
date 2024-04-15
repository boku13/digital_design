`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2024 01:50:31 PM
// Design Name: 
// Module Name: fourbitadder
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

module full_adder(input X, input Y, input Cin, output Sum, output Cout);
    assign {Cout, Sum} = X + Y + Cin;
endmodule

module four_bit_adder(input [3:0] A, input [3:0] B, output [3:0] S, output Co);
    wire [3:0] C;
    full_adder fa0(A[0], B[0], 0, S[0], C[0]);
    full_adder fa1(A[1], B[1], C[0], S[1], C[1]);
    full_adder fa2(A[2], B[2], C[1], S[2], C[2]);
    full_adder fa3(A[3], B[3], C[2], S[3], Co);
endmodule

module testbench_4bitadder;
    reg [3:0]A, B;
    wire [3:0]S;
    wire Cout;
    
four_bit_adder ADD(A, B, S, Cout);
//Test Values
initial begin
//Test Case 1: 3 + 5 = 8
A = 4'b0011; B = 4'b0101; 
#20
//Test Case 2: 12 + 10 = 22 (6 with carry)
A = 4'b1100; B = 4'b1010; 
#20 
//Test Case 3: 7 + 9 = 16 (0 with carry)
A = 4'b0111; B = 4'b1001;
#20 
//Test Case 4: 15 + 1 = 16 (0 with carry)
A = 4'b1111; B = 4'b0001; 
#20
//Test Case 5: 8 + 7 = 15
A = 4'b1000; B = 4'b0111;
#20
//Test Case 6: 9 + 1 = 10     
A = 4'b1001; B = 4'b0001;
#20
$finish;
end

endmodule
