# 1 "test2.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test2.S"






 .section .text
.globl test2

test2:
 SUB SP, SP, #16
 STUR X30 , [ SP, #0 ]
 ADRP X3, print_f_call
 ADD X3,X3, :lo12:print_f_call
 SUB x1,x0,x1
 ADD X0,XZR,X3
 BL printf
 LDUR X30, [ SP , #0 ]
 ADD SP,SP,#16
 BR X30
.section .data
print_f_call:
.asciz "Result of test2(6, 5) = %d\n"
