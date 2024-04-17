`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 01:33:24 PM
// Design Name: 
// Module Name: serialadder_tb
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

module testbench_serialadder();
    reg [3:0] DATA;
    reg loadA, loadB, start, clk, rst;
    wire [3:0] regA, regB;
    wire co, cout_f;

    // Instantiate the Serial Adder
    serialadder uut (
        .DATA(DATA),
        .loadA(loadA),
        .loadB(loadB),
        .start(start),
        .clk(clk),
        .rst(rst),
        .regA(regA),
        .regB(regB),
        .co(co),
        .cout_f(cout_f)
    );

    // Clock generation
    initial clk = 0;
    always #10 clk = ~clk;  // Clock with a period of 20ns

    initial begin
        // Initialize inputs
        rst = 1; loadA = 0; loadB = 0; start = 0;
        DATA = 4'b0000;

        // Reset the adder
        #100;
        rst = 0;

        // Load 4 bits of A (from '2D' -> 0010 first)
        #20; loadA = 1; DATA = 4'b0010;
        #20; loadA = 0;

        // Load 4 bits of B (from 'A5' -> 1010 first)
        #20; loadB = 1; DATA = 4'b1010;
        #20; loadB = 0;

        // Start the serial addition process
        #40; start = 1;
        #160; start = 0;  // Running for 4 cycles (as only least significant bit is processed serially)

        // Load the next 4 bits of A ('2D' -> 1101)
        #20; loadA = 1; DATA = 4'b1101;
        #20; loadA = 0;

        // Load the next 4 bits of B ('A5' -> 0101)
        #20; loadB = 1; DATA = 4'b0101;
        #20; loadB = 0;

        // Continue addition for next bits
        #40; start = 1;
        #160; start = 0;  // Another 4 cycles for the second half of the data

        #100;
        $finish;
    end

endmodule


