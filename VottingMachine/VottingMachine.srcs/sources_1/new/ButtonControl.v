`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 23:09:30
// Design Name: 
// Module Name: ButtonControl
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


    module ButtonControl(
    input clock,
    input reset,
    input button,
    output reg valid_vote
    );
    
    reg [30:0] counter; // it counts 10000000 in 1 sec 
    
    always @(posedge clock)
        begin
            if (reset) // if press reset then it starts from 0
                counter <= 0;
            else
                begin
                    if(button & counter <100000001) // if button =1 and counter<100000001 then the counter increment
                        counter<= counter +1;
                    else if (!button)
                        counter<=0;
                end
        end
    
    always @ (posedge clock)
    begin  // in that period vote is valid or not 
    if(reset)
      valid_vote <= 1'b0; // if reset then all votes are 0
      else
      begin
      if(counter == 100000000) // in 1 sec if counter reaches to 10000000 then only it takesas a valid vote
      valid_vote <= 1'b1;
      else
      valid_vote <=1'b0;
      end
    end
endmodule




