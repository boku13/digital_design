`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2024 01:37:21 PM
// Design Name: 
// Module Name: half_adder_testbench
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


module half_adder_testbench;
reg a, b;
wire s, c;

half_adder HA1(a, b, s, c);

initial begin
a = 0; b = 0;
#10
a = 0; b = 1;
#10
a = 1; b = 1;
#10
a = 1; b =0;
#10
$finish();
end

endmodule
