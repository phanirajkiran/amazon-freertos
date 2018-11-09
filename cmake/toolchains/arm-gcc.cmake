include("cmake/utilities.cmake")

set(CMAKE_SYSTEM_NAME Generic)

# Find GCC for ARM.
find_compiler(ARM_GCC_C arm-none-eabi-gcc)
find_compiler(ARM_GCC_CXX arm-none-eabi-g++)

# Specify the cross compiler.
set(CMAKE_C_COMPILER ${ARM_GCC_C})
set(CMAKE_CXX_COMPILER ${ARM_GCC_CXX})
set(CMAKE_ASM_COMPILER ${ARM_GCC_C})

# Disable compiler checks.
set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_CXX_COMPILER_FORCED TRUE)

# Add target system root to cmake find path.
get_filename_component(ARM_GCC_BIN "${ARM_GCC_C}" DIRECTORY)
get_filename_component(CMAKE_FIND_ROOT_PATH "${ARM_GCC_BIN}" DIRECTORY)

# Don't look for executable in target system prefix.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# Look for includes, libraries and packages in the target system prefix.
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)