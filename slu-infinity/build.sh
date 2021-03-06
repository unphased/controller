#!/bin/bash
# Configure and build firmware for my infinity keyboard.
# Invoke this script from a separate build directory from the controller files.

# This directory, where the source files are located.
SOURCE_DIR=$(dirname ${BASH_SOURCE[0]})
SOURCE_DIR=${SOURCE_DIR%/} #kll/infinity
echo SOURCE_DIR is $SOURCE_DIR

# Configure the build.
cmake                                                                   \
      -DCHIP=mk20dx128vlf5                                              \
      -DScanModule=MD1                                                  \
      -DMacroModule=PartialMap                                          \
      -DOutputModule=pjrcUSB                                            \
      -DDebugModule=full                                                \
      -DBaseMap=defaultMap                                              \
      -DDefaultMap="slu/mybase"                                         \
      -DPartialMaps="slu/mylayer1"                                      \
      ..

# Rebuild.
make clean
make -j8 VERBOSE=1
