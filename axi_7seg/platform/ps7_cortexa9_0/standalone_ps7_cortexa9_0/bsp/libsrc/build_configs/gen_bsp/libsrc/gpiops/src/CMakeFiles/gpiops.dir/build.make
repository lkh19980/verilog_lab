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
CMAKE_SOURCE_DIR = E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp

# Include any dependencies generated for this target.
include libsrc/gpiops/src/CMakeFiles/gpiops.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libsrc/gpiops/src/CMakeFiles/gpiops.dir/compiler_depend.make

# Include the progress variables for this target.
include libsrc/gpiops/src/CMakeFiles/gpiops.dir/progress.make

# Include the compile flags for this target's objects.
include libsrc/gpiops/src/CMakeFiles/gpiops.dir/flags.make

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/flags.make
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.obj: E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_g.c
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.obj"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.obj -MF CMakeFiles/gpiops.dir/xgpiops_g.c.obj.d -o CMakeFiles/gpiops.dir/xgpiops_g.c.obj -c E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_g.c

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpiops.dir/xgpiops_g.c.i"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_g.c > CMakeFiles/gpiops.dir/xgpiops_g.c.i

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpiops.dir/xgpiops_g.c.s"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_g.c -o CMakeFiles/gpiops.dir/xgpiops_g.c.s

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/flags.make
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj: E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_selftest.c
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj -MF CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj.d -o CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj -c E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_selftest.c

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpiops.dir/xgpiops_selftest.c.i"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_selftest.c > CMakeFiles/gpiops.dir/xgpiops_selftest.c.i

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpiops.dir/xgpiops_selftest.c.s"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_selftest.c -o CMakeFiles/gpiops.dir/xgpiops_selftest.c.s

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/flags.make
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.obj: E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops.c
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.obj"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.obj -MF CMakeFiles/gpiops.dir/xgpiops.c.obj.d -o CMakeFiles/gpiops.dir/xgpiops.c.obj -c E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops.c

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpiops.dir/xgpiops.c.i"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops.c > CMakeFiles/gpiops.dir/xgpiops.c.i

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpiops.dir/xgpiops.c.s"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops.c -o CMakeFiles/gpiops.dir/xgpiops.c.s

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/flags.make
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.obj: E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_hw.c
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.obj"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.obj -MF CMakeFiles/gpiops.dir/xgpiops_hw.c.obj.d -o CMakeFiles/gpiops.dir/xgpiops_hw.c.obj -c E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_hw.c

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpiops.dir/xgpiops_hw.c.i"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_hw.c > CMakeFiles/gpiops.dir/xgpiops_hw.c.i

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpiops.dir/xgpiops_hw.c.s"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_hw.c -o CMakeFiles/gpiops.dir/xgpiops_hw.c.s

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/flags.make
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj: E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_sinit.c
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj -MF CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj.d -o CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj -c E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_sinit.c

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpiops.dir/xgpiops_sinit.c.i"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_sinit.c > CMakeFiles/gpiops.dir/xgpiops_sinit.c.i

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpiops.dir/xgpiops_sinit.c.s"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_sinit.c -o CMakeFiles/gpiops.dir/xgpiops_sinit.c.s

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/flags.make
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.obj: E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_intr.c
libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.obj: libsrc/gpiops/src/CMakeFiles/gpiops.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.obj"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.obj -MF CMakeFiles/gpiops.dir/xgpiops_intr.c.obj.d -o CMakeFiles/gpiops.dir/xgpiops_intr.c.obj -c E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_intr.c

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gpiops.dir/xgpiops_intr.c.i"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_intr.c > CMakeFiles/gpiops.dir/xgpiops_intr.c.i

libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gpiops.dir/xgpiops_intr.c.s"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src/xgpiops_intr.c -o CMakeFiles/gpiops.dir/xgpiops_intr.c.s

# Object files for target gpiops
gpiops_OBJECTS = \
"CMakeFiles/gpiops.dir/xgpiops_g.c.obj" \
"CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj" \
"CMakeFiles/gpiops.dir/xgpiops.c.obj" \
"CMakeFiles/gpiops.dir/xgpiops_hw.c.obj" \
"CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj" \
"CMakeFiles/gpiops.dir/xgpiops_intr.c.obj"

# External object files for target gpiops
gpiops_EXTERNAL_OBJECTS =

libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_g.c.obj
libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_selftest.c.obj
libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops.c.obj
libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_hw.c.obj
libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_sinit.c.obj
libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/xgpiops_intr.c.obj
libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/build.make
libsrc/gpiops/src/libgpiops.a: libsrc/gpiops/src/CMakeFiles/gpiops.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C static library libgpiops.a"
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && $(CMAKE_COMMAND) -P CMakeFiles/gpiops.dir/cmake_clean_target.cmake
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gpiops.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libsrc/gpiops/src/CMakeFiles/gpiops.dir/build: libsrc/gpiops/src/libgpiops.a
.PHONY : libsrc/gpiops/src/CMakeFiles/gpiops.dir/build

libsrc/gpiops/src/CMakeFiles/gpiops.dir/clean:
	cd E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src && $(CMAKE_COMMAND) -P CMakeFiles/gpiops.dir/cmake_clean.cmake
.PHONY : libsrc/gpiops/src/CMakeFiles/gpiops.dir/clean

libsrc/gpiops/src/CMakeFiles/gpiops.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/gpiops/src E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src E:/verilog_lab/axi_7seg/platform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/libsrc/build_configs/gen_bsp/libsrc/gpiops/src/CMakeFiles/gpiops.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libsrc/gpiops/src/CMakeFiles/gpiops.dir/depend

