#!/bin/bash

set -eu

for p in $(ls *.patch)
do
    pushd ../src
    patch -u < "../test/$p"
    popd
done

pushd bugs-fixed

for p in $(ls *.patch)
do
    pushd ../../src/bugs-fixed
    patch -p 1 -u < "../../test/bugs-fixed/$p"
    popd
done

popd

pushd testdir

for p in $(ls *.patch)
do
    pushd ../../src/testdir
    patch -p 1 -u < "../../test/testdir/$p"
    popd
done

popd
