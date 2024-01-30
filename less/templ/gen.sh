#!/bin/bash

set -eu

pushd ../src

export VERSION=$(sed -n -r -e 's/.+"([0-9]+)".+/\1/p' ./version.c)
export FILE_VERSION="${VERSION},0,0,0"
export PRODUCT_VERSION="${VERSION}"
export LECAL_COPYRIGHT=$(grep '^Copyright' ./LICENSE)

export FILE_NAME='less.exe'
export FILE_DESCRIPTION='less.exe'
envsubst < ../templ/less.rc > ./less.rc

export FILE_NAME='lesskey.exe'
export FILE_DESCRIPTION='lesskey.exe'
envsubst < ../templ/less.rc > ./lesskey.rc

popd
