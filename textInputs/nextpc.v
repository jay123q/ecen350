module NextPCLogic(
    output reg [63:0] NextPC,
    input      [63:0] CurrentPC,
    input      [63:0] SignExtImm64,
    input             Branch,
    input             ALUZero,
    input             Uncondbranch
);

always @(Uncondbranch or Branch)
begin
    if (Uncondbranch || (Branch && ALUZero))
        NextPC = (CurrentPC + SignExtImm64) << 2;
    else
        NextPC = CurrentPC + 4;
end

endmodule

