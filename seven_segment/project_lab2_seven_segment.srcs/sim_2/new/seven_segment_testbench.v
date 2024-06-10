`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2024 01:29:28 PM
// Design Name: 
// Module Name: seven_segment_testbench
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


module seven_segment_testbench;
reg A0, A1, A2, A3;
wire a, b, c, d, e, f, g;

seven_segment SS1(A0, A1, A2, A3, a, b, c, d, e, f, g);

initial begin
A0 = 0; A1 = 0; A2 = 0; A3 = 0;
#10
A0 = 0; A1 = 0; A2 = 0; A3 = 1;
#10
A0 = 0; A1 = 0; A2 = 1; A3 = 0;
#10
A0 = 0; A1 = 1; A2 = 0; A3 = 0;
#10
A0 = 1; A1 = 0; A2 = 0; A3 = 0;
#10
A0 = 0; A1 = 0; A2 = 1; A3 = 1;
#10
A0 = 0; A1 = 1; A2 = 1; A3 = 0;
#10
A0 = 1; A1 = 1; A2 = 0; A3 = 0;
#10
A0 = 1; A1 = 0; A2 = 0; A3 = 1;
#10
A0 = 1; A1 = 0; A2 = 1; A3 = 0;
#10
A0 = 0; A1 = 1; A2 = 0; A3 = 1;
#10
A0 = 0; A1 = 1; A2 = 1; A3 = 1;
#10
A0 = 1; A1 = 0; A2 = 1; A3 = 1;
#10
A0 = 1; A1 = 1; A2 = 1; A3 = 0;
#10
A0 = 1; A1 = 1; A2 = 0; A3 = 1;
#10
A0 = 1; A1 = 1; A2 = 1; A3 = 1;
$finish();
end

endmodule
