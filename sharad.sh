#!/bin/bash

OPENCV_CONFIG=release

# to setup emscripten environment follow the steps under
# https://emscripten.org/docs/getting_started/downloads.html#installation-instructions-using-the-emsdk-recommended

local_path=/home/sps/Source/github/sps-gold

# we also need a patch to fix opencv build script
git apply sharad.patch

source $local_path/emsdk/emsdk_env.sh

export EMSCRIPTEN=$local_path/emsdk/upstream/emscripten

emcmake python3 /home/sps/Source/github/opencv/platforms/js/build_js.py \
    build --build_wasm \
    --threads \
    --cmake_option="-DCMAKE_BUILD_TYPE=${OPENCV_CONFIG}" \
    --cmake_option="-DWITH_PNG=ON" \
    --cmake_option="-DWITH_JPEG=ON" \
    --cmake_option="-DENABLE_PIC=ON" \
    --cmake_option="-DBUILD_opencv_imgcodecs=ON" \
    --build_flags="-fwasm-exceptions -sSUPPORT_LONGJMP=wasm" \
    -DCMAKE_CROSSCOMPILING_EMULATOR=$local_path/emsdk/node/14.18.2_64bit/bin/node \
    -DCMAKE_TOOLCHAIN_FILE=$local_path/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake




