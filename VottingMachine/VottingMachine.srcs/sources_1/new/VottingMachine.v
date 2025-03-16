`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2025 11:18:22
// Design Name: 
// Module Name: VottingMachine
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


module VottingMachine(
input clock,
input reset,
input mode,
input bt1,
input bt2,
input bt3,
input bt4,
output [7:0] led
);

wire valid_vote_1;
wire valid_vote_2;
wire valid_vote_3;
wire valid_vote_4;
wire [7:0] cand1_vote_recive;
wire [7:0] cand2_vote_recive;
wire [7:0] cand3_vote_recive;
wire [7:0] cand4_vote_recive;
wire anyvalidvote;

assign anyvalidvote = valid_vote_1|valid_vote_2|valid_vote_3|valid_vote_4;

ButtonControl b1(
.clock(clock),
.reset(reset),
.button(bt1),
.valid_vote(valid_vote_1)
);

ButtonControl b2(
.clock(clock),
.reset(reset),
.button(bt2),
.valid_vote(valid_vote_2)
);

ButtonControl b3(
.clock(clock),
.reset(reset),
.button(bt3),
.valid_vote(valid_vote_3)
);

ButtonControl b4(
.clock(clock),
.reset(reset),
.button(bt4),
.valid_vote(valid_vote_4)
);

cadidateVote candidates(
.clock(clock),
.reset(reset),
.mode(mode),
.cand1_vote_valid(valid_vote_1),
.cand2_vote_valid(valid_vote_2),
.cand3_vote_valid(valid_vote_3),
.cand4_vote_valid(valid_vote_4),
.cand1_vote_recive(cand1_vote_recive),
.cand2_vote_recive(cand2_vote_recive),
.cand3_vote_recive(cand3_vote_recive),
.cand4_vote_recive(cand4_vote_recive)
);
    
modeControl mc(
.clock(clock),
.reset(reset),
.mode(mode),
.valid_vote_casted(anyvalidvote),
.candidate1_vote(cand1_vote_recive),
.candidate2_vote(cand2_vote_recive),
.candidate3_vote(cand3_vote_recive),
.candidate4_vote(cand4_vote_recive),
.candidate1_bt_pressed(valid_vote_1),
.candidate2_bt_pressed(valid_vote_2),
.candidate3_bt_pressed(valid_vote_3),
.candidate4_bt_pressed(valid_vote_4),
.led(led)
);
endmodule
