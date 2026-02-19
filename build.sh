#!/bin/bash

BASE=$PWD
OUTPUT=output
mkdir -p $OUTPUT

git submodule update --init --recursive

cd $BASE/$OUTPUT && cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$BASE/$OUTPUT -DWITH_TESTS=OFF -DWITH_TOOLS=OFF -DWITH_TERARK_ZIP=ON -DWITH_TBB=ON -DDISABLE_STALL_NOTIF=ON
cd $BASE/$OUTPUT && make -j $(nproc) && make install > /dev/null 2>&1
