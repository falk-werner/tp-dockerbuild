# tp-dockerbuild
Build WAGO TP image using docker.

## Prerequisites

Make sure that docker is installed on the host system.
To install docjer, please refer to the installation instructions available at the docker homepage:  
[https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)

## Build Docker Image

To build the image, you can use the `create_builder` script.

    ./create_builder.sh

Or you build the image directly via `docker build` command.

    docker build --rm \
      --build-arg "USERID=`id -u`" \
      --build-arg "SKIP_BUILD_IMAGE=" \
      --file Dockerfile --tag tp-builder .

The latters allows to you to tweak image creation,
e.g. provide specific versions or skip building the TP image.

## Get Images

After creating the docker image, you can use the `get_images` script to extract SD card image and WUP file.

    ./get_images.sh

Or you use `docker run` command.

    mkdir -p images
    docker run --rm \
      --user "$(id -u)" \
      -v "`realpath images`:/backup" \
      tp-builder \
      bash -c "cp platform-vtp-ctp/images/sd.hdimg platform-vtp-ctp/images/*.wup /backup"
