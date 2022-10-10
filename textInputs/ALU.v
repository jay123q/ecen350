`define ALUOP_AND    4'b0000
`define ALUOP_ORR    4'b0001
`define ALUOP_ADD    4'b0010
`define ALUOP_SUB    4'b0111
`define ALUOP_PASSB  4'b0110

module alu(
    //output reg [63:0] busW,
    output     [63:0] busW,
    output            zero,
    input      [63:0] busA,
    input      [63:0] busB,
    input      [3:0]  ctrl
);

wire [63:0] subresults [15:0];

assign busW = subresults[ctrl];

// Assign subresults
assign subresults[`ALUOP_AND   ] = busA & busB;
assign subresults[`ALUOP_ORR   ] = busA | busB;
assign subresults[`ALUOP_ADD   ] = busA + busB;
assign subresults[`ALUOP_SUB   ] = busA - busB;
assign subresults[`ALUOP_PASSB ] = busB;

assign zero = busW;

endmodule

