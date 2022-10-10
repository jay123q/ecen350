`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2022 10:06:09 AM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
 output [63:0] BusA;
 output [63:0] BusB;
 input [63:0] BusW;
 input [4:0] RA;
 input [4:0] RB;
 input [4:0] RW;
 input RegWr;
 input Clk;
 reg [63:0] register [31:0];
 
 initial 
 
 register[31] <= 0;
  // given by ta
 assign #4 BusA = register[RA]; 
 assign #4 BusB = register[RB]; 

always @ (negedge Clk)
    begin
        if(RegWr)
        begin
        
            //RW <= BusW; 
            if(RW != 5'b11111)  // 31
            begin
                register[RW] <= #2 BusW;
            end        
        
        end    
    end
 
 
 endmodule
