FROM tensorflow/tensorflow:1.5.0-gpu-py3

LABEL maintainer="David Cardozo <david@kiwicampus.com>"

RUN apt-get update && apt-get install -y \
    git \
    cmake \
    tar \
    build-essential \
    pkg-config \
    libjpeg8-dev \
    libtiff5-dev \
    libjasper-dev \
    libpng12-dev \
    libgtk2.0-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libatlas-base-dev \
    gfortran \
    libavresample-dev \
    libgphoto2-dev \
    libgstreamer-plugins-base1.0-dev \
    libdc1394-22-dev \
    software-properties-common \
    python-software-properties \
    && rm -rf /var/lib/apt/lists/*
########################
# OPENCV     support   #
# Check version:3.4.0  #
########################

WORKDIR /opt/
# GCC 7
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && apt-get install -y  \
    gcc-7 \
    g++-7 \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/opencv/opencv.git \
    && git clone https://github.com/opencv/opencv_contrib.git \
    && cd opencv_contrib && git checkout 3.4.0 \
    && cd /opt/opencv && git checkout 3.4.0 \
    && mkdir build && cd build \
    && cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DBUILD_opencv_python3=ON \
        -DWITH_GTK=ON \
        -DINSTALL_C_EXAMPLES=OFF \
        -DOPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib/modules \
        -DCMAKE_CXX_COMPILER=g++-7 \
        ../ \
    && make -j8 \
    && make install \
    && ldconfig \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /opt/opencv*

WORKDIR /data
EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
