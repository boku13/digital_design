`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 07:30:02 PM
// Design Name: 
// Module Name: binary_clock_tb
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

module binary_clock_tb;
    reg clk;
    reg reset;
    wire [5:0] sec_leds;
    wire [5:0] min_leds;

    // Instantiate the Binary Clock module
    binary_clock bc(
        .clk(clk),
        .reset(reset),
        .sec_leds(sec_leds),
        .min_leds(min_leds)
    );

    // Clock generator (simulating 1 second per 10 ns for quick simulation)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize the clock and reset
        clk = 0;
        reset = 1; 
        #10;
        reset = 0;

        // Let the clock run for some time
        #1200;  // 120 seconds in simulation time, test wrap around of seconds and minutes

        // Reset the clock to see if it starts over correctly
        reset = 1;
        #10;
        reset = 0;
        #100;  // Allow some time to run after reset

        $finish;
    end
endmodule

