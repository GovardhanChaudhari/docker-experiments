# Use a build environment image as the base
FROM ubuntu:20.04

ARG BUILD_ROOT_VERSION=2022.02
ARG BUILD_ROOT_FILE=buildroot-${BUILD_ROOT_VERSION}.tar.gz
ARG BUILD_ROOT_DIR=buildroot-${BUILD_ROOT_VERSION}

# Update and install necessary packages

# Install necessary packages for kernel compilation
#RUN apt-get update && \
#    apt-get install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev wget

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y build-essential bison flex libssl-dev libelf-dev libncurses5-dev file cpio rsync unzip git wget bc

# Download and extract kernel source
WORKDIR /usr/src

RUN wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz && \
    tar -xf linux-5.10.tar.xz && \
    rm linux-5.10.tar.xz

# Change to kernel source directory
WORKDIR /usr/src/linux-5.10

# Configure kernel with default configuration
RUN make defconfig

# Compile kernel
RUN make -j 12

# Install kernel and modules
RUN make modules_install && \
    make install

# Clean up unnecessary packages and files
#RUN apt-get autoremove -y && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /usr/src/linux-5.10

# Set default command to boot into the new kernel
CMD ["/bin/bash"]