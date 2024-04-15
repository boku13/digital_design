`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2024 05:13:51 PM
// Design Name: 
// Module Name: full_adder_four_bit_testbench
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

module full_adder_four_bit_testbench();
reg [3:0] A, B;
reg cin; 
wire [4:0] out; 

four_bit_full_adder ADD(A, B, cin, out);

// Test Values
initial begin
cin = 0; 
    
// Test Case 1: 3 + 5 = 8
A = 4'b0011; B = 4'b0101;
#20
    
// Test Case 2: 12 + 10 = 22 (6 with carry)
A = 4'b1100; B = 4'b1010;
#20 
    
// Test Case 3: 7 + 9 = 16 (0 with carry)
A = 4'b0111; B = 4'b1001;
#20 
    
// Test Case 4: 15 + 1 = 16 (0 with carry)
A = 4'b1111; B = 4'b0001; 
#20
    
// Test Case 5: 8 + 7 = 15
A = 4'b1000; B = 4'b0111;
#20
    
 // Test Case 6: 9 + 1 = 10     
 A = 4'b1001; B = 4'b0001;
 #20
    
 $finish;
endcase 
endmodule
