`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 12:58:03 PM
// Design Name: 
// Module Name: adder
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

module adder(
    input [5:0] A, // 6-bit input A
    input [5:0] B, // 6-bit input B
    input Cin,     // Carry input
    output [5:0] Sum, // 6-bit sum output
    output Cout    // Carry output
);

// Generate (G) and Propagate (P) signals
wire [5:0] G;
wire [5:0] P;
wire [6:0] C; // Intermediate carries, C[0] is Cin

assign C[0] = Cin;

// Calculating Generate and Propagate for each bit
genvar i;
generate
    for (i = 0; i < 6; i = i + 1) begin: loop
        assign G[i] = A[i] & B[i]; // Generate
        assign P[i] = A[i] ^ B[i]; // Propagate
        assign C[i+1] = G[i] | (P[i] & C[i]); // Carry for next bit
    end
endgenerate

// Sum and Carry out calculation
assign Sum = P ^ C[5:0]; // Sum calculation
assign Cout = C[6]; // Final carry out

endmodule
