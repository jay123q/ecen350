#!/bin/sh -f
xv_path="/opt/coe/Xilinx/Vivado/2015.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim NextPClogicTest_behav -key {Behavioral:sim_1:Functional:NextPClogicTest} -tclbatch NextPClogicTest.tcl -log simulate.log
