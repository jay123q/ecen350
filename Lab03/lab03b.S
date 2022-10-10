/*
 * lab03b.S
 *
 *  Created on: Jun 14, 2022
 *      Author: jay123q
 */



.globl lab03b

lab03b:

	ADRP X0, UIN // load the uin in

    ADD X0,X0, :lo12:UIN // load in the address

    LDUR X2, [X0,0]        //load the address to the character

	MOVZ X1, #0 // move in a 0

	cmp x1,10 // move in a 10

	b.le loop_me_daddy

loop_me_daddy:

	ADD X1,X1,#1 //for oop this is i

	ADD X2,X2,#-1 // remove one from uin

	CMP x1,10

	B.LE loop_me_daddy

	B Clean_Mess

Clean_Mess:

	STUR X2, [X0,0] // store in

	BR X30

.section       .data
UIN:  .word 0x21

