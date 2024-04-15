`timescale 1ns / 1ps

module shifter_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [3:0] A;
    reg [1:0] selection;

    // Outputs
    wire [5:0] shifted;
    shifter uut (
        .clk(clk),
        .reset(reset),
        .A(A),
        .selection(selection),
        .shifted(shifted)
    );

 // clock changes every 5 units
    always #5 clk = ~clk;

    // Initially reseting
    initial begin
        clk = 0;
        reset = 1;
        A = 4'b0000;
        selection = 2'b00;
        #10;
        reset = 0;
    end

   
    initial begin
        // Case 1: No shift, load A into the lower bits with 2-bit padding
        #20;
        A = 4'b1010;
        selection = 2'b00;
        #10;
        // Case 2: Shift left by 1
        A = 4'b1010;
        selection = 2'b01;
        #10;
        // Case 3: Shift right by 1, MSB lost, LSB padded with 0
        A = 4'b1010;
        selection = 2'b10;
        #10;
        // Case 4: Shift left by 2
        A = 4'b1010;
        selection = 2'b11;
        #10;
        $finish;
    end

endmodule
