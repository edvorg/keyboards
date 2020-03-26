#! /usr/bin/env bash

set -e

docker build . -t qmk --build-arg KEYBOARD=${1}
docker run -ti --rm --privileged -v /dev/bus/usb:/dev/bus/usb qmk
