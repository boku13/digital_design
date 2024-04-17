`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 07:28:41 PM
// Design Name: 
// Module Name: binary_clock
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

module binary_clock(
    input clk,         // Clock input
    input reset,       // Reset input
    output [5:0] sec_leds,  // 6 LEDs for seconds
    output [5:0] min_leds   // 6 LEDs for minutes
);
    reg [5:0] seconds = 0;
    reg [5:0] minutes = 0;

    // Counter logic for seconds
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            seconds <= 0;
            minutes <= 0;
        end else begin
            if (seconds == 59) begin
                seconds <= 0;
                if (minutes == 59) begin
                    minutes <= 0;
                end else begin
                    minutes <= minutes + 1;
                end
            end else begin
                seconds <= seconds + 1;
            end
        end
    end

    // Output assignment
    assign sec_leds = seconds;
    assign min_leds = minutes;

endmodule

