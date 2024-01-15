#!/bin/bash

set -eu

ROOT="$(cd $(dirname $0); pwd)"
PATCH="$ROOT/patch"
SRC="$ROOT/src"
TEMPL="$ROOT/templ"

rm -rf "$SRC"
git clone --depth 1 https://github.com/onetrueawk/awk.git "$SRC"

pushd "$TEMPL"
"./gen.sh"
popd

pushd "$PATCH"
"./patch.sh"
popd

pushd "$SRC"
make CC="x86_64-w64-mingw32-gcc -g -Wall"
popd

pushd "$SRC/testdir"
x86_64-w64-mingw32-gcc -o echo echo.c
popd