`default_nettype none

module tlc_controller(
    output wire [1:0] highwaySignal, farmSignal, output wire [3:0] JB, input wire Clk,
    input wire Rst

    );
    
    wire RstSync;
    wire RstCount;
    reg [30:0] Count;// follow lab
    // comments here
    assign JB[3] = RstCount;
    synchronizer syncRst(RstSync, Rst, Clk);
    
    tlc_fsm FSM(
    . state(JB[2:0]),
    . highwaySignal(highwaySignal[1:0]),
    . farmSignal(farmSignal[1:0]),
    . Clk(Clk),
    . Rst(RstSync)
    );
    // module synchronizer(
//     output wire OutSignal, 
//     input wire InSignal, 
//     input wire Clk
//);

    // counter
synchronizer(Count,RstCount,Clk);    
    
endmodule
