`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 01:10:19 PM
// Design Name: 
// Module Name: Decoder_4_to_16
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


// Module for a 2-to-4 decoder with an enable input
module Decoder2to4(
    input enable,        // Enable input for the decoder
    input [1:0] a,       // 2-bit input to be decoded
    output [3:0] x       // 4-bit output, each representing one decoded output
);
    // Generate decoded outputs based on the input value 'a' and 'enable'
    // Each line corresponds to one combination of inputs producing a high output
    assign x[0] = enable & ~a[1] & ~a[0];  // Output for input 00
    assign x[1] = enable & ~a[1] & a[0];   // Output for input 01
    assign x[2] = enable & a[1] & ~a[0];   // Output for input 10
    assign x[3] = enable & a[1] & a[0];    // Output for input 11
endmodule

// Main module for a 4-to-16 decoder using two stages of 2-to-4 decoders
module Decoder4to16(
    input enable,         
    input [3:0] A,        // 4-bit input to be decoded
    output [15:0] Y       // 16-bit output, each bit representing one decoded output
);
    wire [3:0] en; // Intermediate enable signals for the second stage decoders

    // First stage decoder: decodes the higher two bits of the input
    // and generates enable signals for the second stage decoders
    Decoder2to4 firstStage(.enable(enable), .a(A[3:2]), .x(en));

    // Second stage decoders: each decodes the lower two bits of the input
    // Enabled individually by the outputs of the first stage decoder
    Decoder2to4 secondStage0(.enable(en[0]), .a(A[1:0]), .x(Y[3:0]));    // Decodes for input starting with 00
    Decoder2to4 secondStage1(.enable(en[1]), .a(A[1:0]), .x(Y[7:4]));    // Decodes for input starting with 01
    Decoder2to4 secondStage2(.enable(en[2]), .a(A[1:0]), .x(Y[11:8]));   // Decodes for input starting with 10
    Decoder2to4 secondStage3(.enable(en[3]), .a(A[1:0]), .x(Y[15:12]));  // Decodes for input starting with 11
endmodule
