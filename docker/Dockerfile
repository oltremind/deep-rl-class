ARG base_image="nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04"
FROM ${base_image}

LABEL maintainer="oltremind@outlook.com"

ARG python_version="python3.10"
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive

# Basic tools + tzdata first
RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        software-properties-common \
        curl \
        tmux \
        htop \
        wget \
        cmake \
        vim \
        git \
        unzip \
        less \
    && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && rm -rf /var/lib/apt/lists/*

# Add deadsnakes PPA
RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update \
    && rm -rf /var/lib/apt/lists/*

# Install Python + distutils + tkinter
RUN apt-get update && apt-get install -y --no-install-recommends \
        ${python_version} \
        ${python_version}-dev \
        ${python_version}-distutils \
        ${python_version}-tk \
    && rm -rf /var/lib/apt/lists/*

# Install pip for selected Python
RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py \
    && ${python_version} /tmp/get-pip.py \
    && rm /tmp/get-pip.py

# Install CuDNN if NVIDIA image
RUN case "${base_image}" in \
       *"nvidia"*) ${python_version} -m pip install --force-reinstall "nvidia-cudnn-cu11~=8.6.0.0" ;; \
       *) echo "Skip installing CuDNN. This is a CPU only image." ;; \
    esac

RUN ${python_version} -m pip freeze

CMD ["/bin/bash"]