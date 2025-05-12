`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 05:03:37 PM
// Design Name: 
// Module Name: test_ripple_carry
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


module test_ripple_carry;
reg [2:0] in1,in2;
wire [2:0] sum,carry;

ripple_carry_adder r(in1,in2,sum,carry);

initial
begin
in1 = 3'b011;
in2 = 3'b011;
#3;
$display("Sum : %b\n Carry : %b",sum,carry);
$finish;
end
endmodule
