`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2022 09:39:14 AM
// Design Name: 
// Module Name: HalfAdd
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


module HalfAdd( Cout, Sum, A, B);

input A,B;

output Cout,Sum;

xor xor1(Sum,A,B);

and and1(Cout, A,B);

endmodule
