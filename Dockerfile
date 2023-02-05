# Use a build environment image as the base
FROM ubuntu:20.04

ARG BUILD_ROOT_VERSION=2022.02
ARG BUILD_ROOT_VOLUME="buildroot"
ARG BUILD_ROOT_FILE=buildroot-${BUILD_ROOT_VERSION}.tar.gz
ARG BUILD_ROOT_DIR=buildroot-${BUILD_ROOT_VERSION}

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y
#RUN apt-get install -y build-essential git wget bc bison flex libssl-dev libncurses5-dev file cpio rsync unzip ccze

RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y bc
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y libssl-dev
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y file
RUN apt-get install -y cpio
RUN apt-get install -y rsync
RUN apt-get install -y unzip
#RUN apt-get install -y ccze too old
#RUN apt-get install -y pv too old

# Install Python 3 and pip
#RUN apt-get install -y python3 python3-pip

WORKDIR /temp

# Download and extract Buildroot
RUN wget https://buildroot.org/downloads/${BUILD_ROOT_FILE}
RUN tar -xvzf ${BUILD_ROOT_FILE}

RUN cp -r ${BUILD_ROOT_DIR}/ /${BUILD_ROOT_VOLUME}/

# Set the working directory to Buildroot
WORKDIR /${BUILD_ROOT_VOLUME}

# Configure Buildroot for the Raspberry Pi 4
RUN make raspberrypi4_defconfig

#ENV TERM=xterm-256color
#RUN export TERM=xterm-256color
#RUN echo $TERM

# Build the kernel and its dependencies
RUN make -j 10

# Copy the compiled kernel to a directory on the host
RUN mkdir /output
RUN cp output/images/zImage /output