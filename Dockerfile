# Use a build environment image as the base
FROM ubuntu:20.04

ARG BUILD_ROOT_VERSION=2022.02.9
ARG BUILD_ROOT_DIR=buildroot

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential git wget bc bison flex libssl-dev libncurses5-dev file cpio rsync unzip

# RUN apt-get install -y build-essential
# RUN apt-get install -y git
# RUN apt-get install -y wget
# RUN apt-get install -y bc
# RUN apt-get install -y bison
# RUN apt-get install -y flex
# RUN apt-get install -y libssl-dev
# RUN apt-get install -y libncurses5-dev
# RUN apt-get install -y file
# RUN apt-get install -y cpio
# RUN apt-get install -y rsync
# RUN apt-get install -y unzip


# Configure Buildroot for the Raspberry Pi 4
#RUN make raspberrypi4_defconfig

# Build the kernel and its dependencies
#RUN CFLAGS="-O2 -g -MMD" make -j12

# Copy the compiled kernel to a directory on the host
#RUN mkdir /output
#RUN cp output/images/zImage /output
CMD ["/bin/bash"]