# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe

# The command to remove a file.
RM = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp

# Utility rule file for scutimer.

# Include any custom commands dependencies for this target.
include CMakeFiles/scutimer.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/scutimer.dir/progress.make

CMakeFiles/scutimer:
	lopper -O E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/scutimer/src E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/hw_artifacts/ps7_cortexa9_0_baremetal.dts -- baremetalconfig_xlnx ps7_cortexa9_0 C:/Xilinx/Vitis/2023.2/data/embeddedsw/XilinxProcessorIPLib/drivers/scutimer_v2_5/src

scutimer: CMakeFiles/scutimer
scutimer: CMakeFiles/scutimer.dir/build.make
.PHONY : scutimer

# Rule to build all files generated by this target.
CMakeFiles/scutimer.dir/build: scutimer
.PHONY : CMakeFiles/scutimer.dir/build

CMakeFiles/scutimer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/scutimer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/scutimer.dir/clean

CMakeFiles/scutimer.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp E:/verilog_lab/axi_2023_2/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles/scutimer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/scutimer.dir/depend

