//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 02/28/2024 01:18:44 PM
//// Design Name: 
//// Module Name: bcd_adder_subtractor_testbench
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

//module testbench;
//// Inputs
//reg [3:0] A;        // Minuend input
//reg [3:0] B;     // Subtrahend input
//reg M; 
//// Outputs
//wire C_sign;        // Sign output
//wire [4:0] out_value;
//wire [3:0] out;
//wire [6:0] seg_out; // Seven-segment display output

//// Instantiate the BCD_Addition_Subtraction module 
//BCD_Addition_Subtraction uut (
//.A(A),
//.B(B),
//.M(M),
//.out_value(out_value),
//.seg_out(seg_out),
//.C_sign(C_sign)
//);

//reg [3:0] out; // Output to capture the lower 4 bits of out_value
//assign out = out_value[3:0]; // Assigning the lower 4 bits of out_value to out

//// Test cases
//initial begin
//// Test case 1
//M = 1; A = 4'b1001; // 9 in BCD
//B = 4'b0110; // 6 in BCD
//#40;

//// Test case 2
//M = 1; A = 4'b0011; // 3 in BCD
//B = 4'b0111; // 7 in BCD
//#40;

//// Test case 3 (Invalid BCD)
//M = 1; A = 4'b1011; // Invalid BCD
//B = 4'b0101; // 5 in BCD
//#40;

//// Test case 4
//M = 0; A = 4'b1001; // 9 in BCD
//B = 4'b1001; // 9 in BCD
//#40;

//// Test case 5
//M = 0; A = 4'b1001; // 9 in BCD
//B = 4'b1001; // 9 in BCD
//#40;

//// Test case 6
//M = 0; A = 4'b0011; // 3 in BCD
//B = 4'b0111; // 7 in BCD
//#40;

//// Test case 7 (Invalid BCD)
//M = 0; A = 4'b1010; // Invalid BCD
//B = 4'b0110; // 6 in BCD
//#40;

//// End simulation
//$finish;
//end
//endmodule


`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 23:39:41
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

module testbench_add_sub;

// Inputs
reg [3:0] A;
reg [3:0] B;
reg M;

// Outputs
wire C_sign;
wire [4:0] out_value;
wire [3:0] out;
wire [6:0] seg_out;

BCD_Addition_Subtraction uut(
.A(A), .B(B), .M(M), 
.out_value(out_value), .seg_out(seg_out), .C_sign(C_sign));

wire [3:0] out;
assign out = out_value[3:0];

initial begin
    M=1; A= 4'b1001; B= 4'b0110;
    #20;    // Subtraction
    M=1; A= 4'b0011; B= 4'b0111; 
    #20;     // Subtraction
    M=1; A= 4'b1011; B= 4'b1001; 
    #20;    // Invalid inputs
    M=0; A= 4'b1000; B=4'b0001; 
    #20;
    M=0; A= 4'b1011; B=4'b1111;
    #20;    // Invalid inputs
    M=0; A= 4'b1001; B=4'b0110;
    #20;    // Addition
    M=1; A=4'b0011; B= 4'b0100; 
    #20;    // Negative Subtraction
    M=1; A=4'b0001; B=4'b1000; 
    #20;
    M=0; A=4'b0010; B=4'b0010; 
    #20;
    M=0; A= 4'b0101; B= 4'b1000; 
    #20;
$finish;
end
endmodule



//module testbench;
//    // Inputs
//    reg [3:0] A;  // Minuend input
//    reg [3:0] B;  // Subtrahend input
//    reg M;        // Operation mode (0 for addition, 1 for subtraction)
    
//    // Outputs
//    wire C_sign;      // Sign output
//    wire [4:0] out_value;  // Output value
//    wire [6:0] seg_out;    // Seven-segment display output
    
//    // Instantiate the BCD_Addition_Subtraction module 
//    BCD_Addition_Subtraction uut (
//        .A(A),
//        .B(B),
//        .M(M),
//        .out_value(out_value),
//        .seg_out(seg_out),
//        .C_sign(C_sign)
//    );

//    // Intermediate wire for displaying only the lower 4 bits of out_value
//    wire [3:0] out;
//    assign out = out_value[3:0];

//    // Test case
//    initial begin
//        // Initialize inputs
//        M = 1;    // Set subtraction mode
//        A = 4'b1000; // 8 in BCD
//        B = 4'b0110; // 6 in BCD
//        #40;
        
//        // Apply inputs
//        M = 1;    // Set subtraction mode
//        A = 4'b0011; // 3 in BCD
//        B = 4'b0101; // 5 in BCD
//        #40;
        
//        // Apply inputs (Invalid case)
//        M = 1;    // Set subtraction mode
//        A = 4'b1101; // Invalid input
//        B = 4'b0111; // 7 in BCD
//        #40;
        
//        // Apply inputs
//        M = 0;    // Set addition mode
//        A = 4'b1001; // 9 in BCD
//        B = 4'b1001; // 9 in BCD
//        #40;
        
//        // Apply inputs
//        M = 0;    // Set addition mode
//        A = 4'b0001; // 1 in BCD 
//        B = 4'b1011; // 11 in BCD
//        #40;
        
//        // Apply inputs
//        M = 0;    // Set addition mode
//        A = 4'b0100; // 4 in BCD 
//        B = 4'b0001; // 1 in BCD       
//        #40;
//        $finish;
        
//    end
//endmodule