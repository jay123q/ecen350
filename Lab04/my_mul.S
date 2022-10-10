        .globl my_mul

my_mul:
        //Multiply X0 and X1
        //   Does not handle negative X1!
        //   Note : This is an in efficient way to multipy!
        SUB SP, SP, 16          //make room for X19 on the stack
        STUR X19, [SP, 0]       //push X19
        ADD X19, X1, XZR        //set X19 equal to X1
        ADD X9 , XZR , XZR      //set X9 to 0
        // NOTE THAT HAVING 16 HERE IS A OVERALLOCATION, not a issue just too much
mult_loop:
        CBZ X19,  mult_eol
        ADD X9, X9, X0
        SUB X19, X19, 1
        B mult_loop
mult_eol:
        LDUR X19, [SP, 0]
        ADD SP,SP,16 // THE ERROR WAS HERE THE SP WAS NOT REALLOCATED
        ADD X10, X9, X10         // Move X9 to X0 to return
        ADD X11,X11,#1
        BR X30

