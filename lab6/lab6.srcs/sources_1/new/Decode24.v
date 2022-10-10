`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2022 10:04:36 AM
// Design Name: 
// Module Name: Decode24
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

module Decode24 ( out , in ) ;

    input [ 1 : 0 ] in ;
    
    output reg [ 3 : 0 ] out ; //  store the output
    
    
    always@(in)
        begin
            if(in[1] == 1'b0 & in[0] == 1'b0) out=4'b0001;
            if(in[1] == 1'b0 & in[0] == 1'b1) out=4'b0010;
            if(in[1] == 1'b1 & in[0] == 1'b0) out=4'b0100;
            if(in[1] == 1'b1 & in[0] == 1'b1) out=4'b1000;

        end 
endmodule
