#!/bin/bash

set -eu

pushd ../src

export PRODUCT_VERSION=$(grep -o -P 'version \d{8}' ./main.c | cut -d ' ' -f 2)

PATCH_COUNT=$(ls -l ../patch/*.patch | wc -l)

export FILE_VERSION=$(echo -n ${PRODUCT_VERSION} | sed -n -r -e "s/([0-9]{4})([0-9]{2})([0-9]{2})/\1,\2,\3,${PATCH_COUNT}/p")

export FILE_DESCRIPTION=$(sed -n -e "/^## What's New/,/^### Strings/ {
    /^#/b
    /^$/b
    N
    s/\n/ /p
}" ./README.md)

export LECAL_COPYRIGHT=$(sed -n -e '/^Copyright/,/^$/ {
    /^$/b
    N
    s/\n/ /p
}' ./LICENSE)

HASH=$(git log -1 --format="%H")
SHORT_HASH=${HASH:0:12}

export PRODUCT_VERSION="${PRODUCT_VERSION}-${SHORT_HASH}"

envsubst < ../templ/awk.rc > ./awk.rc

popd
