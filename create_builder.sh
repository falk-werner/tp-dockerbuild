#!/bin/sh

docker build --rm \
    --build-arg "USERID=`id -u`" \
    --build-arg "SKIP_BUILD_IMAGE=" \
    --file Dockerfile --tag tp-builder .

