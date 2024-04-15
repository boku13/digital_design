`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 12:42:42 PM
// Design Name: 
// Module Name: multiplier
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

module multiplier(
    input clk,
    input reset,
    input [3:0] inp,
    output [6:0] sum  // Updated to 7-bit output
);
    wire [5:0] nstar2_extended; 
    wire [5:0] nstar4_extended;
    wire [5:0] intermediate_sum; // This is a temporary 6-bit sum from the adder
    wire carry_out;  // Temporary carry out

    // Instantiate shifter modules with corrected bit widths
    shifter m2(.clk(clk), .reset(reset), .A(inp), .selection(2'b01), .shifted(nstar2_extended));
    shifter m4(.clk(clk), .reset(reset), .A(inp), .selection(2'b11), .shifted(nstar4_extended));

    // Use an adder to sum the outputs of the shift registers
    adder a1(
        .A(nstar2_extended), 
        .B(nstar4_extended), 
        .Cin(0), 
        .Sum(intermediate_sum), 
        .Cout(carry_out)
    );

    // Combine the sum and the carry out to form a 7-bit output
    assign sum = {carry_out, intermediate_sum};  // Prepend carry_out to intermediate_sum to form 7 bits

    // Print statements to observe values on every positive edge of the clock
    always @(posedge clk) begin
        if (!reset) begin  // Only display values when not in reset
            $display("Time: %t, Input: %b", $time, inp);
            $display("Shifted *2 (nstar2_extended): %b", nstar2_extended);
            $display("Shifted *4 (nstar4_extended): %b", nstar4_extended);
            $display("7-bit Sum: %b", sum);
        end
    end

    // Also print on reset to observe reset state
    always @(posedge reset) begin
        $display("Reset activated at time: %t", $time);
        $display("All outputs and intermediates are reset to zero or default states.");
    end
endmodule

