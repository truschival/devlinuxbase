FROM debian:trixie-slim
LABEL maintainer="Thomas Ruschival <t.ruschival@gmail.com>" \
      org.opencontainers.image.source="https://github.com/truschival/devlinuxbase"

# Setup language environment and encoding
ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Update package cache, upgrade existing packages, and install devtools
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        bc \
        bison \
        build-essential \
        ca-certificates \
        cmake \
        curl \
        doxygen \
        flex \
        g++ \
        gcc \
        gcovr \
        git \
        lcov \
        libssl-dev \
        libtool \
        ninja-build \
        pkgconf \
        sudo \
        unzip \
        uuid-dev \
        vim-tiny \
        zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add a build user with passwordless sudo access
RUN useradd -m -s /bin/bash -u 1001 -G src,sudo builduser && \
    passwd -d builduser && \
    echo "builduser ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/builduser && \
    chmod 0440 /etc/sudoers.d/builduser
