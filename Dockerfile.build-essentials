# Use a build environment image as the base
FROM ubuntu:20.04

ARG KERNEL_VERSION=5.10
ARG KERNEL_FILE=linux-${KERNEL_VERSION}.tar.gz
ARG BUILD_DIR=linux-${KERNEL_VERSION}

# Install necessary packages for compilation
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y build-essential bison flex libssl-dev libelf-dev libncurses5-dev file cpio rsync unzip git wget bc

# Set default command to boot into the new kernel
CMD ["/bin/bash"]