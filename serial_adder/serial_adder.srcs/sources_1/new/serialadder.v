`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 01:31:09 PM
// Design Name: 
// Module Name: serialadder
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


module serialadder ( DATA, loadA, loadB, start, clk, regA, regB, rst, co, cout_f);

    input [3:0] DATA;
    input loadA, loadB, start, clk, rst;
    output reg [3:0] regA, regB;
    output co;
    output reg cout_f;



    reg cin;
    reg [27:0] count = 0;
    
    wire w1, w2, w3, sum, cout;

    // Clock divider to generate 'co' signal
    assign co = count[27];

    // Increment count on every clock edge
    always @(posedge clk)
        count <= count + 1;

    // 1-bit full adder logic
    xor (sum, regA[0], regB[0], cin);
    and (w1, regA[0], regB[0]);
    and (w2, regA[0], cin);
    and (w3, regB[0], cin);
    or (cout, w1, w2, w3);

    // 4-bit serial adder logic
    always @(posedge co)  // for bitstream
//    always @(posedge clk) // for testbench 
    begin
        if (rst) 
        begin
            regA <= 4'b0000;
            regB <= 4'b0000;
            cin <= 1'b0;
//            cout_f <= 1'b0;
        end 
        else if (loadA) 
        begin
            regA <= DATA;
        end 
        else if (loadB) 
        begin
            regB <= DATA;
        end 
        else if (start) 
        begin
            regB <= regB >> 1;
            regA <= regA >> 1;
            regA[3] <= sum;
            cin <= cout;
            cout_f <= cout;
        end
    end

endmodule
