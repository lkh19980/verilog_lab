@echo off
cd /D E:\verilog_lab\my_axi_test2\platform\zynq_fsbl\zynq_fsbl_bsp\libsrc\build_configs\gen_bsp || (set FAIL_LINE=2& goto :ABORT)
arm-none-eabi-ar -qcs E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libxil.a E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/coresightps_dcc/src/CMakeFiles/coresightps_dcc.dir/xcoresightpsdcc.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/devcfg/src/CMakeFiles/devcfg.dir/xdevcfg.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/devcfg/src/CMakeFiles/devcfg.dir/xdevcfg_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/devcfg/src/CMakeFiles/devcfg.dir/xdevcfg_hw.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/devcfg/src/CMakeFiles/devcfg.dir/xdevcfg_intr.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/devcfg/src/CMakeFiles/devcfg.dir/xdevcfg_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/devcfg/src/CMakeFiles/devcfg.dir/xdevcfg_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/dmaps/src/CMakeFiles/dmaps.dir/xdmaps.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/dmaps/src/CMakeFiles/dmaps.dir/xdmaps_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/dmaps/src/CMakeFiles/dmaps.dir/xdmaps_hw.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/dmaps/src/CMakeFiles/dmaps.dir/xdmaps_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/dmaps/src/CMakeFiles/dmaps.dir/xdmaps_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scugic/src/CMakeFiles/scugic.dir/xscugic_hw.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scugic/src/CMakeFiles/scugic.dir/xscugic_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scugic/src/CMakeFiles/scugic.dir/xscugic_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scugic/src/CMakeFiles/scugic.dir/xscugic_intr.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scugic/src/CMakeFiles/scugic.dir/xscugic_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scugic/src/CMakeFiles/scugic.dir/xscugic.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scutimer/src/CMakeFiles/scutimer.dir/xscutimer.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scutimer/src/CMakeFiles/scutimer.dir/xscutimer_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scutimer/src/CMakeFiles/scutimer.dir/xscutimer_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scutimer/src/CMakeFiles/scutimer.dir/xscutimer_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scuwdt/src/CMakeFiles/scuwdt.dir/xscuwdt.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scuwdt/src/CMakeFiles/scuwdt.dir/xscuwdt_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scuwdt/src/CMakeFiles/scuwdt.dir/xscuwdt_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/scuwdt/src/CMakeFiles/scuwdt.dir/xscuwdt_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/uartps/src/CMakeFiles/uartps.dir/xuartps_hw.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/uartps/src/CMakeFiles/uartps.dir/xuartps_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/uartps/src/CMakeFiles/uartps.dir/xuartps_intr.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/uartps/src/CMakeFiles/uartps.dir/xuartps_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/uartps/src/CMakeFiles/uartps.dir/xuartps.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/uartps/src/CMakeFiles/uartps.dir/xuartps_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/uartps/src/CMakeFiles/uartps.dir/xuartps_options.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/usbps/src/CMakeFiles/usbps.dir/xusbps.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/usbps/src/CMakeFiles/usbps.dir/xusbps_endpoint.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/usbps/src/CMakeFiles/usbps.dir/xusbps_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/usbps/src/CMakeFiles/usbps.dir/xusbps_hw.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/usbps/src/CMakeFiles/usbps.dir/xusbps_intr.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/usbps/src/CMakeFiles/usbps.dir/xusbps_sinit.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/xadcps/src/CMakeFiles/xadcps.dir/xadcps.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/xadcps/src/CMakeFiles/xadcps.dir/xadcps_g.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/xadcps/src/CMakeFiles/xadcps.dir/xadcps_intr.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/xadcps/src/CMakeFiles/xadcps.dir/xadcps_selftest.c.obj E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libsrc/xadcps/src/CMakeFiles/xadcps.dir/xadcps_sinit.c.obj || (set FAIL_LINE=3& goto :ABORT)
C:\Xilinx\Vitis\2024.1\tps\win64\cmake-3.24.2\bin\cmake.exe -E copy E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/libsrc/build_configs/gen_bsp/libxil.a E:/verilog_lab/my_axi_test2/platform/zynq_fsbl/zynq_fsbl_bsp/lib || (set FAIL_LINE=4& goto :ABORT)
goto :EOF

:ABORT
set ERROR_CODE=%ERRORLEVEL%
echo Batch file failed at line %FAIL_LINE% with errorcode %ERRORLEVEL%
exit /b %ERROR_CODE%