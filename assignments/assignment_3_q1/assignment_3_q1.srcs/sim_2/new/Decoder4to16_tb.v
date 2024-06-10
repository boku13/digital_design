`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 01:14:40 PM
// Design Name: 
// Module Name: Decoder4to16_tb
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

module Decoder4to16_tb;

reg enable_tb;
reg [3:0] A_tb;
wire [15:0] Y_tb;

Decoder4to16 uut (
    .enable(enable_tb),
    .A(A_tb),
    .Y(Y_tb)
);

initial begin
    // Initialize Inputs
    enable_tb = 0;
    A_tb = 0;
    #200;
    
    enable_tb = 1; // Enable the decoder for testing
    
    // Test Case 1: Input 0000
    A_tb = 4'b0000;
    #200; 
    
    // Test Case 2: Input 0001
    A_tb = 4'b0001;
    #200;
    
    // Test Case 3: Input 0010
    A_tb = 4'b0010;
    #200;
    
    // Test Case 4: Input 0011
    A_tb = 4'b0011;
    #200;
    
    // Test Case 5: Input 0100
    A_tb = 4'b0100;
    #200;
    
    // Test Case 6: Input 0101
    A_tb = 4'b0101;
    #200;
    
    // Test Case 7: Input 0110
    A_tb = 4'b0110;
    #200;
    
    // Test Case 8: Input 0111
    A_tb = 4'b0111;
    #200;
    
    // Test Case 9: Input 1000
    A_tb = 4'b1000;
    #200;
    
    // Test Case 10: Input 1001
    A_tb = 4'b1001;
    #200;
    
    $finish;
end

endmodule
