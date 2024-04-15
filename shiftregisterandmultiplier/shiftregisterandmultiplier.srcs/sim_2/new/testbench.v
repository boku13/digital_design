`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2024 02:01:42 AM
// Design Name: 
// Module Name: testbench
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


`timescale 1ns / 1ps

module tb_multiplier();

    reg clk;
    reg reset;
    reg [3:0] inp;
    wire [6:0] sum;  // Adjusted for 7-bit output

    // Instantiate the modified multiplier
    multiplier uut(
        .clk(clk),
        .reset(reset),
        .inp(inp),
        .sum(sum)  // Only sum is needed, no Cout
    );

    // Clock generation
    always #10 clk = ~clk;  // Generate a clock with a period of 20 ns

    // Initial block to provide test stimuli
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        inp = 4'b0000;

        // Reset the design
        #30 reset = 0;

        // Sequentially test various input values
        inp = 4'b0001; #20;
        inp = 4'b0010; #20;
        inp = 4'b0011; #20;
        inp = 4'b0100; #20;
        inp = 4'b0101; #20;
        inp = 4'b0110; #20;
        inp = 4'b0111; #20;
        inp = 4'b1000; #20;
        inp = 4'b1001; #20;
        inp = 4'b1010; #20;
        inp = 4'b1011; #20;
        inp = 4'b1100; #20;
        inp = 4'b1101; #20;
        inp = 4'b1110; #20;
        inp = 4'b1111; #20;

        // Reassert reset to test reset functionality
        reset = 1; #20;
        reset = 0; #20;

        // Finish simulation
        $finish;
    end

    // Optional: Output waveforms for analysis
    initial begin
        $dumpfile("multiplier_tb.vcd");
        $dumpvars(0, tb_multiplier);
    end

    // Monitoring outputs
    initial begin
        $monitor("Time = %t, Input = %b, 7-bit Sum = %b", $time, inp, sum);
    end

endmodule




