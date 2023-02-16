# Use a build environment image as the base
FROM ubuntu:20.04

ARG KERNEL_VERSION=5.10
ARG KERNEL_FILE=linux-${KERNEL_VERSION}.tar.gz
ARG BUILD_DIR=linux-${KERNEL_VERSION}

# Install necessary packages for kernel compilation
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y build-essential bison flex libssl-dev libelf-dev libncurses5-dev file cpio rsync unzip git wget bc

# Download and extract kernel source
WORKDIR /usr/src

RUN wget https://cdn.kernel.org/pub/linux/kernel/v5.x/${KERNEL_FILE} && \
    tar -xf ${KERNEL_FILE} && \
    rm ${KERNEL_FILE}

# Change to kernel source directory
WORKDIR /usr/src/${BUILD_DIR}

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