`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 04:58:12 PM
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder(
input [2:0] in1,
input [2:0] in2,
output [2:0] sum,
output [2:0] carry
);
full_adder f1(in1[0],in2[0],1'b0,sum[0],carry[0]);
full_adder f2(in1[1],in2[1],carry[0],sum[1],carry[1]);
full_adder f3(in1[2],in2[2],carry[1],sum[2],carry[2]);
endmodule
