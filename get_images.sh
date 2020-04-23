#!/bin/sh

mkdir -p images
docker run --rm \
    --user "$(id -u)" \
    -v "`realpath images`:/backup" \
    tp-builder \
    bash -c "cp platform-vtp-ctp/images/sd.hdimg platform-vtp-ctp/images/*.wup /backup"
