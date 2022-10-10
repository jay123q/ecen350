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
ExecStep $xv_path/bin/xelab -wto 5325ef9f3b3f47f59bffc246e5369412 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot SingleCycleProcTest_v_behav xil_defaultlib.SingleCycleProcTest_v xil_defaultlib.glbl -log elaborate.log
