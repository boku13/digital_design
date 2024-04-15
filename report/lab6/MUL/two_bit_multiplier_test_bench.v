`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 02:34:25 PM
// Design Name: 
// Module Name: two_bit_multiplier_test_bench
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


module two_bit_multiplier_test_bench();
reg [1:0] A, B;
wire [3:0] P;

two_bit_multiplier mul(.A(A), .B(B), .P(P));

initial begin

A = 2'b01; B = 2'b10;
#20;

A = 2'b11; B = 2'b11;
#20;

A = 2'b00; B = 2'b01;
#20;

A = 2'b10; B = 2'b01;
#20;

A = 2'b11; B = 2'b00;
#20

A = 2'b01; B = 2'b01;
#20;

A = 2'b10; B = 2'b10;
#20;

A = 2'b00; B = 2'b00;
#20;

$finish;

end

endmodule
