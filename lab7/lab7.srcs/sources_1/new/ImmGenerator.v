`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2022 08:51:28 AM
// Design Name: 
// Module Name: ImmGenerator
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


module ImmGenerator(Imm64, Imm26, Ctrl);
  output reg [63:0] Imm64;
  input [25:0] Imm26;
  input [2:0] Ctrl;


  always @(*)
  begin
       if(Ctrl == 3'b000)
       // I type
    
         Imm64 = {52'b0,Imm26[21:10]};
         
       if(Ctrl == 3'b001)
       // L/S
         Imm64 = {{55{Imm26[20]}},Imm26[20:12]};
    
       if(Ctrl == 3'b010)
       // uncon branch
         Imm64 = {{38{Imm26[25]}},Imm26[25:0]};
    
    
       if(Ctrl == 3'b011)
       // cond branch
         Imm64 = {{45{Imm26[23]}},Imm26[23:5]};
        // move addition
        if(Ctrl == 3'b100)
            
           Imm64 = {{48{1'b0}}, Imm26[20:5]};
            
        if(Ctrl == 3'b101)
            
           Imm64 = {{32{1'b0}}, Imm26[20:5], 16'b0};
            
        if(Ctrl == 3'b110)
            
            Imm64 = {{16{1'b0}}, Imm26[20:5], 32'b0};
            
        if(Ctrl == 3'b111)
            
            Imm64 = {Imm26[20:5], 48'b0};
            

  end

endmodule
