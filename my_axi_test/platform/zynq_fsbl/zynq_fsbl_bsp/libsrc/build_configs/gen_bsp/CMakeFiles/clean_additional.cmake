# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\diskio.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ff.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ffconf.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\sleep.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs_config.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilrsa.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xiltimer.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xtimer_config.h"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilffs.a"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilrsa.a"
  "E:\\verilog_lab\\my_axi_test\\platform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxiltimer.a"
  )
endif()
