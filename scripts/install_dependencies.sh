# !/bin/bash

apt update
apt install swig -y cmake
apt install cmake

apt-get update
apt-get install -y python3-opengl
install ffmpeg
install xvfb
install pyvirtualdisplay

python3.10 -m pip install -r requirements.txt
python3.10 -m pip install pyvirtualdisplay