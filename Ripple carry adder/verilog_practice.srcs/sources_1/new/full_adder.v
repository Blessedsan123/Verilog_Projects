`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 04:51:16 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
input in1,
input in2,
input in3,
output sum,
output carry
);
wire s1,c1,c2;
half_adder h1(in1,in2,s1,c1);
half_adder h2(s1,in3,sum,c2);
assign carry = c1|c2;
endmodule
