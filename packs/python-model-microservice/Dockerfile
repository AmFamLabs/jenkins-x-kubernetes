FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ARG app_name
#ARG PIP_EXTRA_INDEX_URL TODO: enable this and disable below once skaffold support build args from env vars
COPY ./PIP_EXTRA_INDEX_URL ./PIP_EXTRA_INDEX_URL

# basic build and devel dependencies
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python-software-properties \
    build-essential \
    wget \
    curl \
    bash \
    curl \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    pkg-config \
    rsync \
    unzip \
    python-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    libgeos-dev \
    libcurl3 \
    python-pycurl \
    python-opencv \
    python-lxml \
    python-pip

RUN apt-get update && apt-get install -y --allow-change-held-packages --allow-downgrades --no-install-recommends \
    libcudnn7=7.0.5.15-1+cuda9.0 \
    libcudnn7-dev=7.0.5.15-1+cuda9.0 && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip install --upgrade pip

RUN mkdir -p /var/log/$app_name
RUN mkdir -p /var/lib/$app_name
WORKDIR /usr/local/$app_name
COPY . .
RUN export PIP_EXTRA_INDEX_URL=$(cat PIP_EXTRA_INDEX_URL) && make setup

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["make run"]
