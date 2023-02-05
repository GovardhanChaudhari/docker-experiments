# Use a build environment image as the base
FROM ubuntu:20.04

ARG BUILD_ROOT_VERSION=2022.02
ARG BUILD_ROOT_FILE=buildroot-${BUILD_ROOT_VERSION}.tar.gz
ARG BUILD_ROOT_DIR=buildroot-${BUILD_ROOT_VERSION}

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential git wget bc bison flex libssl-dev libncurses5-dev file cpio rsync unzip

# Download and extract Buildroot
RUN wget https://buildroot.org/downloads/${BUILD_ROOT_FILE}
RUN tar -xvzf ${BUILD_ROOT_FILE}

# Set the working directory to Buildroot
WORKDIR /${BUILD_ROOT_DIR}

# Configure Buildroot for the Raspberry Pi 4
RUN make raspberrypi4_defconfig

# Build the kernel and its dependencies
RUN make

# Copy the compiled kernel to a directory on the host
RUN mkdir /output
RUN cp output/images/zImage /output