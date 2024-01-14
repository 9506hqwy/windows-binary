#!/bin/bash

set -eu

ROOT="$(cd $(dirname $0); pwd)"
SRC="$ROOT/src"
TEST="$ROOT/test"

pushd "$TEST"
"./patch.sh"
popd
