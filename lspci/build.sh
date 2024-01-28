#!/bin/bash

set -eu

TAG_NAME='v3.10.0'

ROOT="$(cd $(dirname $0); pwd)"
SRC="$ROOT/src"

rm -rf "$SRC"
git clone -b "${TAG_NAME}" --depth 1 https://github.com/pciutils/pciutils.git "$SRC"

pushd "$SRC"
make CROSS_COMPILE=x86_64-w64-mingw32- HOST=x86_64-windows ZLIB=no IDSDIR=""
popd
