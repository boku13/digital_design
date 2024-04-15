`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 12:52:57 PM
// Design Name: 
// Module Name: ALU_testbench
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


module testALU;
reg [3:0] A;
reg [3:0] B;
reg [2:0] Op;
wire [3:0] Y;
wire S;
ALU alu(A,B, Op, Y, S);
initial begin
    A = 4'b0110; B = 4'b1001; Op= 3'b000; #10;
    A = 4'b0110; B = 4'b1001; Op= 3'b001; #10;
    A = 4'b0110; B = 4'b1001; Op= 3'b010; #10;
    A = 4'b0110; B = 4'b1001; Op= 3'b011; #10;
    A = 4'b0110; B = 4'b1001; Op= 3'b100; #10;
    A = 4'b0110; B = 4'b1001; Op= 3'b101; #10;
    A = 4'b0110; B = 4'b1001; Op= 3'b110; #10;
    A = 4'b0110; B = 4'b1001; Op= 3'b111; #20;
    
    A= 4'b1010; B= 4'b0110; 
    Op= 3'b000; #10;
    Op= 3'b001; #10;
    Op= 3'b010; #10;
    Op= 3'b011; #10;
    Op= 3'b100; #10;
    Op= 3'b101; #10;
    Op= 3'b110; #10;
    Op= 3'b111; #10;
    
    
    $finish;
    end
endmodule
