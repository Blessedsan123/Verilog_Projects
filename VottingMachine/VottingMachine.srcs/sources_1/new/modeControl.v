`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2025 11:34:58
// Design Name: 
// Module Name: modeControl
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


module modeControl(
input clock,
input reset,
input mode,
input valid_vote_casted,
input [7:0] candidate1_vote,
input [7:0] candidate2_vote,
input [7:0] candidate3_vote,
input [7:0] candidate4_vote,
input candidate1_bt_pressed,
input candidate2_bt_pressed,
input candidate3_bt_pressed,
input candidate4_bt_pressed,
output reg [7:0] led
);

reg [30:0] counter;

always @(posedge clock)
begin
if(reset)
counter <= 0;
else if(valid_vote_casted)
counter<= counter+1;
else if(counter !=0 & counter<10000000)
counter<= counter+1;
else 
counter <= 0;
end


always @ (posedge clock)
begin
if(reset)
led <= 0;
else
begin
if(!mode & counter >0) //mode 0 = voting mode , mode 1 = result mode
  led <= 8'hff;
  else if(!mode)
  led <= 8'h00;
else if (mode)
begin
if(candidate1_bt_pressed)
led <= candidate1_vote;

else if(candidate2_bt_pressed)
led <= candidate2_vote;

else if(candidate3_bt_pressed)
led <= candidate3_vote;

else if(candidate4_bt_pressed)
led <= candidate4_vote;

end
end
end
endmodule
