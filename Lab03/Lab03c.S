/*
 * Lab03c.S
 *
 *  Created on: Jun 14, 2022
 *      Author: jay123q
 */
.globl Lab03c

Lab03c:
// you need to add your offset
//	ORR X1, XZR, #4 //add offset X1 is offset variable

	ADRP X1, my_array // load the uin in

    ADD X1,X1, :lo12:my_array // load in the address

//	LDUR X2, [X1,0] // store the next address to open

	MOVZ X3, #0 // move in a 0 // X3 IS I

	cmp X3,10 // move in a 10

	b.le loop_me_daddy

loop_me_daddy:

//	LDUR X2, [X1,0] // store the next address to open
//

	STUR X0, [X1,0] // store the next address to open

	ADD X0,X0,#1 // increment j

	ADD X3,X3,#1 //for loop this is i

	ADD X1,X1,#4 // ADD OFFSET OF 4 BYTE

	CMP x3,10 // is I less than 10

	B.LE loop_me_daddy

	B Clean_Mess

Clean_Mess:

	BR X30



.section       .data
my_array:  .space
