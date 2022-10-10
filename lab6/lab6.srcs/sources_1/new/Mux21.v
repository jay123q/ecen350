`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2022 09:52:53 AM
// Design Name: 
// Module Name: Mux21
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

module Mux21 ( out , in , sel ) ;

input [ 1 : 0 ] in ;

input sel ;

output out ;

wire notS,passBS, passnotSA;

and andGate(passBS,sel,in[1]);

not notGate(notS,sel);

and andGate2(passnotSA,notS,in[0]);

or orGate(out, passBS,passnotSA);


endmodule
