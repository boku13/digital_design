`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 10:41:59 PM
// Design Name: 
// Module Name: half_subtractor
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

module half_sub(input a, input b, output difference, output borrow);
assign difference = a^b;
assign borrow = (~a)&b;
endmodule

module half_subtractor_test;
reg a, b;
wire difference, borrow;
half_sub SUB(a, b, difference, borrow);
initial begin
//Test Cases
a = 0; b = 0;
#10;
a = 0; b = 1;
#10;
a = 1; b = 0;
#10;
a = 1; b = 1;
#10;
$finish;
end 
endmodule
