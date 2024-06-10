`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 12:29:05 PM
// Design Name: 
// Module Name: PriorityEncoderTb
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

module tb_PriorityEncoder;

// Inputs
reg I3, I2, I1, I0;

// Outputs
wire Y1, Y0, V;

// Instantiate the Unit Under Test (UUT)
PriorityEncoder uut (
    .I3(I3), 
    .I2(I2), 
    .I1(I1), 
    .I0(I0), 
    .Y1(Y1), 
    .Y0(Y0), 
    .V(V)
);

initial begin
    // All 16 possible inputs
    // I3 has the highest priority, followed by I2, then I1, and I0 has the lowest priority.
    I3 = 0; I2 = 0; I1 = 0; I0 = 0; #50; // Base case, all inputs are low
    I3 = 0; I2 = 0; I1 = 0; I0 = 1; #50; // Lowest priority bit is high
    I3 = 0; I2 = 0; I1 = 1; I0 = 0; #50; // I1 takes priority over I0
    I3 = 0; I2 = 0; I1 = 1; I0 = 1; #50; // Show that I1 takes priority over I0
    I3 = 0; I2 = 1; I1 = 0; I0 = 0; #50; // I2 takes priority over I1 and I0
    I3 = 0; I2 = 1; I1 = 0; I0 = 1; #50; // I2 takes priority over lower bits
    I3 = 0; I2 = 1; I1 = 1; I0 = 0; #50; // I2 takes priority over I1 and I0
    I3 = 0; I2 = 1; I1 = 1; I0 = 1; #50; // I2 takes priority over lower bits
    I3 = 1; I2 = 0; I1 = 0; I0 = 0; #50; // I3 has the highest priority
    I3 = 1; I2 = 0; I1 = 0; I0 = 1; #50; // I3 has the highest priority, lower bits don't matter
    I3 = 1; I2 = 0; I1 = 1; I0 = 0; #50; // I3 has the highest priority, lower bits don't matter
    I3 = 1; I2 = 0; I1 = 1; I0 = 1; #50; // I3 has the highest priority, lower bits don't matter
    I3 = 1; I2 = 1; I1 = 0; I0 = 0; #50; // I3 has the highest priority
    I3 = 1; I2 = 1; I1 = 0; I0 = 1; #50; // I3 has the highest priority, lower bits don't matter
    I3 = 1; I2 = 1; I1 = 1; I0 = 0; #50; // I3 has the highest priority, lower bits don't matter
    I3 = 1; I2 = 1; I1 = 1; I0 = 1; #50; // I3 has the highest priority, all inputs are high
end

initial begin
    $monitor("At time %t, I3=%b, I2=%b, I1=%b, I0=%b --> V=%b, Y1=%b, Y0=%b",
             $time, I3, I2, I1, I0, V, Y1, Y0);
end

endmodule

