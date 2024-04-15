//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 02/28/2024 01:07:57 PM
//// Design Name: 
//// Module Name: bcd_adder_subtractor
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

//module BCD_Addition_Subtraction (
//    input [3:0] A, // 4-bit BCD input for minuend
//    input [3:0] B, // 4-bit BCD input for subtrahend
//    input M,       // Selection line (M = 1 for subtraction, M = 0 for addition)
//    output reg [4:0] out_value,
//    output reg [6:0] seg_out, // Output for seven-segment display
//    output reg C_sign        // Output carry or sign (Sign: 1 if negative, 0 otherwise; Carry: )
//);

//// Perform subtraction or addition
//always @(*)
//begin
//    if (A <= 4'b1001 && B <= 4'b1001) begin
//        if (M == 1) begin
//            if (A >= B) begin
//                // Non-negative subtraction
//                out_value = A - B;
//                C_sign = 0;
//                $display ("A = %b, B = %b,Non-Negative Subtraction: %b, C_out_Sign: %b, Output value: %d", A, B, M, C_sign, out_value);
//            end
//            else begin
//                // Negative subtraction
//                out_value = B - A;
//                C_sign = 1;
//                $display ("A = %b, B = %b,Negative Subtraction: %b, C_out_Sign: %b, Output value: %d", A, B, M, C_sign, out_value);
//            end
//        end
//        else begin
//            // Addition
//            out_value = A + B;
//            if (out_value > 4'b1001) begin
//                // Carry out if sum exceeds 9
//                C_sign = 1;
//                out_value = out_value + 4'b0110;
//                $display ("A = %b, B = %b, Addition with sum exceeding 9: %b, C_out_Sign: %b, Output value: %d", A, B, M, C_sign, out_value);
//            end
//            else
//                C_sign = 0;
//                $display ("A = %b, B = %b, Addition with sum below 9: %b, C_out_Sign: %b, Output value: %d", A, B, M, C_sign, out_value);
//        end
//    end
//    else begin
//        out_value = 4'b1111;
//        $display ("Invalid BCD input");
//    end
//end

//// Display the absolute value of the difference on common anode seven-segment display
//always @(*)
//begin
//    case (out_value[3:0])
//        4'b0000: seg_out = 7'b1000000; // Display 0
//        4'b0001: seg_out = 7'b1111001; // Display 1
//        4'b0010: seg_out = 7'b0100100; // Display 2
//        4'b0011: seg_out = 7'b0110000; // Display 3 
//        4'b0100: seg_out = 7'b0011001; // Display 4
//        4'b0101: seg_out = 7'b0010010; // Display 5
//        4'b0110: seg_out = 7'b0000010; // Display 6
//        4'b0111: seg_out = 7'b1111000; // Display 7
//        4'b1000: seg_out = 7'b0000000; // Display 8
//        4'b1001: seg_out = 7'b0010000; // Display 9
//        default: seg_out = 7'b1111111; // Blank display for other values
//    endcase
//end

//endmodule


//module add_sub (input [3:0] A, [3:0] B, input M, output [6:0] seg_out, output c_out_sign);
//BCD_Addition_Subtraction addition_sub (A, B, M, out_val, seg_out, c_out_sign);
//endmodule



`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 23:05:39
// Design Name: 
// Module Name: bcd_adder_subtractor
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

//module bcd_adder_subtractor(
//input [3:0] A, input [3:0] B, input M,
//output reg [4:0] out_value, output reg[6:0] seg_out, output reg C_sign);
//reg [4:0] temp_out_value;
//always @(*)
//begin if (A<= 4'b1001 && B<= 4'b1001)
//begin
//if (M==1)
//    begin
//    if (A>=B)
//        begin
//        out_value= A-B;
//        C_sign= 0;
//        end
//    else
//    begin
//        out_value= B-A;
//        C_sign = 1;
//    end
//    end
//else
//begin
//        temp_out_value = A+B;
//        if( temp_out_value> 4'b1001)
//            begin
//                C_sign =1;
//                out_value = temp_out_value + 4'b0110;
//            end
//            else
//            begin
//                out_value= temp_out_value;
//                C_sign=0;
//            end
//         end
//         $display("A= %b, B= %b, Subtraction?: %b, C_out_Sign: %b, Output value: %d", A, B, M, C_sign, out_value[4:0]);
//         end
//    else out_value= 4'b1111;
//    end
// // Display the absolute value of the difference on common cathode seven-segment display
//    always @(*)
//    begin
//        case (out_value [3:0])
//            4'b0000: seg_out = 7'b0111111; // Display 0
//            4'b0001: seg_out = 7'b0000110; // Display 1
//            4'b0010: seg_out = 7'b1011011; // Display 2
//            4'b0011: seg_out = 7'b1001111; // Display 3
//            4'b0100: seg_out = 7'b1100110; // Display 4
//            4'b0101: seg_out = 7'b1101101; // Display 5
//            4'b0110: seg_out = 7'b1111101; // Display 6
//            4'b0111: seg_out = 7'b0000111; // Display 7
//            4'b1000: seg_out = 7'b1111111; // Display 8
//            4'b1001: seg_out = 7'b1101111; // Display 9
//            default: seg_out = 7'b0000000;  // Blank display for other values
//        endcase
//    end

//endmodule

//module bcd_adder_subtractor(input [3:0] A, [3:0] B, input M, output [6:0] seg_out, output c_out_sign);

//BCD_Addition_Subtraction addsub(A, B, M, out_value,seg_out, c_out_sign);
////BCD_to_7 BCD(out_value[3:0], seg_out); // Correctly pass the 4 LSBs of out_value to BCD_to_7

//endmodule

module BCD_Addition_Subtraction (
    input [3:0] A, // 4-bit BCD input for minuend
    input [3:0] B, // 4-bit BCD input for subtrahend
    input M,       // Selection line (M = 1 for subtraction, M = 0 for addition)
    output reg [4:0] out_value,
    output reg [6:0] seg_out, // Output for seven-segment display
    output reg C_sign       // Output carry or sign (Sign: 1 if negative, 0 otherwise; Carry: 1 representing BCD Carry,0 otherwise;)
);

reg [4:0] temp_out_value;

    // Perform addition or subtraction
    always @(*)
    begin
        if (A <= 4'b1001 && B <= 4'b1001)
        begin
            if (M == 1)     //Subtraction
            begin
                // 9's complement subtraction  but here i m not converting the binary into 9's figure only using that method
                out_value = A + (~B) + 1;
                if (out_value[4] == 1) 
                    begin
                        out_value = ~(out_value[3:0])+1;
                        C_sign = 1;
                    end
                else 
                    begin
                        out_value = out_value[3:0];
                        C_sign = 0;
                    end
            end
            else         //Addition
            begin
                temp_out_value = A + B;
                if (temp_out_value > 4'b1001)
                    begin
                        // Carry out if sum exceeds 9
                        C_sign = 1;
                        out_value = temp_out_value + 4'b0110;
                    end
                else
                    begin
                        out_value = temp_out_value;
                        C_sign = 0;
                    end
            end
            $display("A=%b, B=%b, Subtraction?: %b, C_out_Sign: %b, Output value: %d",A,B,M,C_sign,out_value[4:0]);
        end
        else
            out_value = 4'b1111; // Indicate invalid input
    end

    // Display the absolute value of the difference on common cathode seven-segment display
    always @(*)
    begin
        case (out_value [3:0])
            4'b0000: seg_out = 7'b0111111; // Display 0
            4'b0001: seg_out = 7'b0000110; // Display 1 
            4'b0010: seg_out = 7'b1011011; // Display 2
            4'b0011: seg_out = 7'b1001111; // Display 3 
            4'b0100: seg_out = 7'b1100110; // Display 4
            4'b0101: seg_out = 7'b1101101; // Display 5 
            4'b0110: seg_out = 7'b1111101; // Display 6 
            4'b0111: seg_out = 7'b0000111; // Display 7 
            4'b1000: seg_out = 7'b1111111; // Display 8 
            4'b1001: seg_out = 7'b1101111; // Display 9
            default: seg_out = 7'b0000000;  // Blank display for other values
        endcase
    end

endmodule

module add_sub (
    input [3:0] A,
    input [3:0] B,
    input M,
    output [6:0] seg_out,
    output c_out_sign
); 
    BCD_Addition_Subtraction addition_sub (
        .A(A),
        .B(B),
        .M(M),
        .out_value(),
        .seg_out(seg_out),
        .C_sign(c_out_sign)
    );
endmodule

