/*
 * Lab04b.S
 *
 *  Created on: Jun 21, 2022
 *      Author: jay123q
 */

        .globl Lab04b
Lab04b:
		ADD X12, X0,XZR
		B Factorial
Factorial:
        SUB SP, SP, 16          //make room for X0 on the stack
        STUR X30, [SP,8]
        STUR X0, [SP, 0]       //push X0
		ADD X10,XZR,XZR // This is the register we are going to add x9 to in my_mul
		add x11,xzr,xzr // this will be a counter to decide if we can be done as a pop given the 2! last number has to be 2
		SUBS XZR,X0,0x1 // compare m with 1
		B.GE remove_1
		ORR X0,XZR,#1
		ADD SP,SP,16 //  add back stack pointers

		BR x30

remove_1:
		SUB x0,x0,#1 // M=M-1
		BL Factorial

loop_f:
	LDUR X1, [SP,0]
	LDUR X30, [SP,8]
	ADD X2,XZR,X30 // store address
	ADD SP,SP,16
	BL my_mul
	ADD X30,X2,XZR // reload address
//	ADD X0,X10,XZR // return the X0
	cmp X12,X11
	B.EQ END
	BR x30
END:
	add x0,x10,xzr
	br x30

