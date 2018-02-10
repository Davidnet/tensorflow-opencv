# Docker image with tensorflow and OpenCV (python3)

So here is the thing: Image with GTK (for imshow) and python3 binding with tensorflow with jupyter enabled.
Hope this will make a better enviroment for python developers 

# Jupyter notebook with opencv support:
```
docker run --init -it --rm -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY davidnet/tensorflow_opencv
```
Observe that is necessary to connect to X11 server so that opencv can show the images.

# Image
```
docker pull davidnet/tensorflow-opencv
```

# TODO:
* Using Docker compose
* Using multilayer docker
