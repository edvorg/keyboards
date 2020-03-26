FROM ubuntu:19.10

RUN apt update -y && apt install -y git python3 gcc-arm-none-eabi gcc-avr avrdude dfu-programmer dfu-util

RUN apt install -y python3-pip

RUN python3 -m pip install qmk

RUN yes | qmk setup

ARG KEYBOARD

ENV KEYBOARD=$KEYBOARD

ADD ${KEYBOARD}/keymap.c /root/qmk_firmware/keyboards/${KEYBOARD}/keymaps/docker/keymap.c

RUN qmk compile -kb ${KEYBOARD} -km docker

CMD qmk flash -kb ${KEYBOARD} -km docker
