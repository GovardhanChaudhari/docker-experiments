# Use a build environment image as the base
FROM ubuntu:20.04

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential git wget bc bison flex libssl-dev libncurses5-dev file cpio rsync unzip

# Download and extract Buildroot
RUN wget https://buildroot.org/downloads/buildroot-2022.02.tar.gz
RUN tar -xvzf buildroot-2022.02.tar.gz

# Set the working directory to Buildroot
WORKDIR /buildroot-2022.02

# Configure Buildroot for the Raspberry Pi 4
RUN make raspberrypi4_defconfig

# Build the kernel and its dependencies
RUN make

# Copy the compiled kernel to a directory on the host
RUN mkdir /output
RUN cp output/images/zImage /output