#!/bin/bash

set -eu

for p in $(ls *.patch)
do
    pushd ../src
    patch -u < "../patch/$p"
    popd
done
