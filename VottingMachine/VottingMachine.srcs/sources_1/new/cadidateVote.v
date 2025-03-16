`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2025 11:03:10
// Design Name: 
// Module Name: cadidateVote
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


module cadidateVote(
input clock,
input reset,
input mode,
input cand1_vote_valid,
input cand2_vote_valid,
input cand3_vote_valid,
input cand4_vote_valid,
output reg [7:0] cand1_vote_recive,
output reg [7:0] cand2_vote_recive,
output reg [7:0] cand3_vote_recive,
output reg [7:0] cand4_vote_recive
);

always @(posedge clock)
begin
if(reset)
begin
cand1_vote_recive <=0;
cand2_vote_recive <=0;
cand3_vote_recive <=0;
cand4_vote_recive <=0;
end

else
begin
if(cand1_vote_valid & !mode)
   cand1_vote_recive<= cand1_vote_recive +1;
   
 else  if(cand2_vote_valid & !mode)
   cand2_vote_recive<= cand2_vote_recive +1;
   
  else if(cand3_vote_valid & !mode)
   cand3_vote_recive<= cand3_vote_recive +1;
   
  else if(cand4_vote_valid & !mode)
   cand4_vote_recive<= cand4_vote_recive +1;
   
end
end

endmodule
