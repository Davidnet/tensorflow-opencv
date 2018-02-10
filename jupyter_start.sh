#!/bin/env bash¬
xhost +local:0¬
nvidia-docker run --init -it --rm -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v `pwd`/notebooks/:/data davidnet/tensorflow-opencv 
