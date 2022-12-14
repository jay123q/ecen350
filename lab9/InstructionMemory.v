`timescale 1ns / 1ps
/*
 * Module: InstructionMemory
 *
 * Implements read-only instruction memory
 *
 */
module InstructionMemory(Data, Address);
`timescale 1ns / 1ps

    output [31:0] Data;
    input [63:0]  Address;
    reg [31:0] 	 Data;

    /*
    * ECEN 350 Processor Test Functions
    * Texas A&M University
    */

    always @ (Address) begin
        case(Address)
        /* Test Program 1:
         * Program loads constants from the data memory. Uses these constants to test
         * the following instructions: LDUR, ORR, AND, CBZ, ADD, SUB, STUR and B.
         *
         * Assembly code for test:
         *
         * 0x00: ORR  X20, XZR, XZR     //Create a base memory address
         * 0x04: LDUR X9,  [X20, 0x0]   //Load 1 into x9
         * 0x08: LDUR X10, [X20, 0x8]   //Load a into x10
         * 0x0c: LDUR X11, [X20, 0x10]  //Load 5 into x11
         * 0x10: LDUR X12, [X20, 0x18]  //Load big constant into x12
         * 0x14: LDUR X13, [X20, 0x20]  //load a 0 into X13
         *
         * 0x18: ORR X10, X10, X11  //Create mask of 0xf
         * 0x1c: AND X12, X12, X10  //Mask off low order bits of big constant
         *
         * loop:
         * 0x20: CBZ X12, end  //while X12 is not 0
         * 0x24: ADD X13, X13, X9  //Increment counter in X13
         * 0x28: SUB X12, X12, X9  //Decrement remainder of big constant in X12
         * 0x2c: B loop  //Repeat till X12 is 0
         * 0x30: STUR X13, [X20, 0x20]  //store back the counter value into the memory location 0x20
         * 0x34: LDUR X13, [X20, 0x20]  //One last load to place stored value on memdbus for test checking.
         */

        64'h000: Data = 32'hAA1F03F4;
        64'h004: Data = 32'hF8400289;
        64'h008: Data = 32'hF840828A;
        64'h00c: Data = 32'hF841028B;
        64'h010: Data = 32'hF841828C;
        64'h014: Data = 32'hF842028D;
        64'h018: Data = 32'hAA0B014A;
        64'h01c: Data = 32'h8A0A018C;
        64'h020: Data = 32'hB400008C;
        64'h024: Data = 32'h8B0901AD;
        64'h028: Data = 32'hCB09018C;
        64'h02c: Data = 32'h17FFFFFD;
        64'h030: Data = 32'hF802028D;
        64'h034: Data = 32'hF842028D;


        /* Add code for your tests here */

        /*

		0x3c: MOVZ x9 [def0, 0]     // def0
		0x40: MOVZ x8 [9abc, 16]    // 9abc 0000
		0x44: ADD x9, x8, x9        // 9abc def0
		0x48: MOVZ x8 [5678, 32]    // 5678 0000 0000
		0x4c: MOVZ x9, x8, x9       // 5678 9abc def0
		0x50: MOVZ x8 [1234, 48]    // 1234 0000 0000 0000
		0x54: ADD x9, x8, x9        // 1234 5678 9abc def0
		0x58: STUR x9 [XZR, 28]     // address = 0 + 0x28 -> offset = 0x28
		0x5c: LDUR x10 [XZR, 28]    // LDUR from address 0x28
		*/
		
		
		
		// 
		64'h03c: Data = {9'b110100101,2'b00,16'hdef0,5'd9}; 
		64'h040: Data = {9'b110100101,2'b01,16'h9abc,5'd8};
		64'h044: Data = {11'b10001011000,5'd9,6'b0,5'd8,5'd9};
		64'h048: Data = {9'b110100101,2'b10,16'h5678,5'd8};
		64'h04c: Data = {11'b10001011000,5'd9,6'b0,5'd8,5'd9 };
		64'h050: Data = {9'b110100101,2'b11,16'h1234,5'd8};
		64'h054: Data = {11'b10001011000,5'd9,6'b0,5'd8,5'd9 };
		64'h058: Data = {11'bXX111000000,9'h28,2'b0,5'd31,5'd9};
		64'h05c: Data = {11'bXX111000010,9'h28,2'b0,5'd31,5'd10};


        default: Data = 32'hXXXXXXXX;
        endcase
    end
endmodule

