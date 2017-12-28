FROM ubuntu:14.04

# runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    software-properties-common \
    curl \
    wget \
    git \
    unzip \
    pkg-config \
    cmake \
    autoconf \
    automake \
    bzip2 \
    dpkg-dev \
    imagemagick \
    libbz2-dev \
    libc6-dev \
    libcurl4-openssl-dev \
    libdb-dev \
    libevent-dev \
    libffi-dev \
    libgdbm-dev \
    libgeoip-dev \
    libglib2.0-dev \
    libjpeg-dev \
    libkrb5-dev \
    liblzma-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libopenblas-dev \
    liblapack3 \
    liblapack-dev \
    libpng-dev \
    libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libwebp-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    xz-utils \
    zlib1g-dev \
    tcl \
    tk
RUN rm -rf /var/lib/apt/lists/*
