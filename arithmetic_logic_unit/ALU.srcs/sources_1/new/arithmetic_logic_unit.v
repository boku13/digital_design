`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 03:13:16 PM
// Design Name: 
// Module Name: arithmetic_logic_unit
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


module ALU(input [3:0] A, input [3:0] B, input [2:0] Op, output reg [3:0]Y, output reg S );

always @(*)
begin

    casex(Op)
       
        3'b000: Y= 4'b0000;
        3'b001: {S,Y}= A+B;
        3'b010: if(A>B)
                    begin
                        Y= A-B; S=1'b0;
                    end
                 else
                    begin
                        Y= B-A; S=1'b1;
                    end
        3'b011: begin
                Y=A&B;
                S=1'bx;
                end
        3'b100: begin
                Y=A|B;
                S=1'bx;
                end
        3'b101: begin
                Y=A^B;
                S=1'bx;
                end
        3'b110: begin
                Y= ~(A^B);
                S=1'bx;
                end
        3'b111:  begin   
                Y= 4'b1111;
                S=1'bx;
                end
       
        endcase
end
endmodule