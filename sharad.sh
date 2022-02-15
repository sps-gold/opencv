#!/bin/bash

OPENCV_CONFIG=release

source /home/sps/Source/github/sps-gold/emsdk/emsdk_env.sh

export EMSCRIPTEN=/home/sps/Source/github/sps-gold/emsdk/upstream/emscripten

emcmake python3 /home/sps/Source/github/opencv/platforms/js/build_js.py \
    build --build_wasm \
    --threads \
    --cmake_option="-DCMAKE_BUILD_TYPE=${OPENCV_CONFIG}" \
    --cmake_option="-DWITH_PNG=ON" \
    --cmake_option="-DWITH_JPEG=ON" \
    --cmake_option="-DENABLE_PIC=ON" \
    --cmake_option="-DBUILD_opencv_imgcodecs=ON" \
    --build_flags="-fwasm-exceptions -sSUPPORT_LONGJMP=wasm" \
    -DCMAKE_CROSSCOMPILING_EMULATOR=/home/sps/Source/github/sps-gold/emsdk/node/14.18.2_64bit/bin/node \
    -DCMAKE_TOOLCHAIN_FILE=/home/sps/Source/github/sps-gold/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake




