FROM debian:11.2-slim
LABEL maintainer="Thomas Ruschival <t.ruschival@gmail.com>"

# Setup language environment and encoding 
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Update package cache and install devtools
RUN apt-get update && \
	apt-get install -y \
		autoconf \
		automake \
		bc \
		bison \
		build-essential \
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
		pkg-config \
		sudo \
		unzip \
		uuid-dev \
		vim-tiny \
		zip \
	&& apt-get clean

# Add a build user
RUN useradd -m -s /bin/bash -u 1001 -G src,sudo -p xxx builduser

#Create user specific sudoers.d file
RUN echo "builduser ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/builduser && \
    chmod 0440 /etc/sudoers.d/builduser
