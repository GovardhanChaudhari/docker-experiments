# Use a build environment image as the base
FROM docker-experiments_test-build-essentials

ARG KERNEL_VERSION=5.10
ARG KERNEL_FILE=linux-${KERNEL_VERSION}.tar.gz
ARG BUILD_DIR=linux-${KERNEL_VERSION}

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