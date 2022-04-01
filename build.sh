#!/bin/bash

CFLAGS="-fPIC"

function cc {
    gcc "$CFLAGS" -c -o "$1" "${@:2}"
}
function link {
    gcc -o "$1" "${@:2}"
}

set -o xtrace
set -o errexit

cc liba1.o liba1.c
link liba1.so liba1.o -shared

cc liba2.o liba2.c
link liba2.so liba2.o -shared

cc libb.o libb.c
link libb.so libb.o liba2.so -shared -Wl,--rpath="\$ORIGIN"

cc main.o main.c
link main main.o liba1.so libb.so -Wl,--rpath="\$ORIGIN"

link libb_static.so libb.o liba2.o -shared -Wl,--version-script=libb_static.version
link main_static main.o liba1.so libb_static.so -Wl,--rpath="\$ORIGIN"
