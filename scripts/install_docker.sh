#!/bin/bash

docker build --build-arg base_image=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04 \
  --tag ai:core -f docker/Dockerfile docker/