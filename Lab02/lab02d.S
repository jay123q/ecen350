.section .text
.globl lab02d


lab02d:
       ADRP X3, myvalue
       ADD X3,X3, :lo12:myvalue
       ADD   X4, X0, 1000       //add 1000 to address
       STUR X4, [X3,0] // first digit of the result
	   ADD X0,X3,XZR
       BR X30
.section .data
myvalue:
.word
