#!/bin/bash

set -e
folder=${HOME}/home

echo " ** INSTALL DEPENDENCIES "
sudo apt install \
libssl1.0.0 \
libgstreamer1.0-0 \
gstreamer1.0-tools \
gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad \
gstreamer1.0-plugins-ugly \
gstreamer1.0-libav \
libgstrtspserver-1.0-0 \
libjansson4=2.11-1

echo "** Install Dependencies"
cd folder
git clone https://github.com/edenhill/librdkafka.git
cd librdkafka
git reset --hard 7101c2310341ab3f4675fc565f64f0967e135a6a
./configure
make
sudo make install
sudo mkdir -p /opt/nvidia/deepstream/deepstream-6.0/lib        
sudo cp /usr/local/lib/librdkafka* /opt/nvidia/deepstream/deepstream-6.0/lib

echo "** Install newest nvidia-l4t-streamer  " 
sudo apt install --reinstall nvidia-l4t-gstreamer
sudo apt install --reinstall nvidia-l4t-multimedia
sudo apt install --reinstall nvidia-l4t-core
