# Use an official Ubuntu-based image as the base image
FROM ubuntu:20.04

# Install the required packages
RUN apt-get update && apt-get install -y kpartx mtd-utils

# Copy the image file to the container
#COPY image_you_want_to_convert.img /

WORKDIR /home/berryboot

# Run the container as the root user
USER root

# Run the following commands in the shell
RUN kpartx -av image_you_want_to_convert.img \
    && mount /dev/mapper/loop0p2 /mnt \
    && sed -i 's/^\/dev\/mmcblk/#\0/g' /mnt/etc/fstab \
    && sed -i 's/^PARTUUID/#\0/g' /mnt/etc/fstab \
    && rm -f /mnt/etc/console-setup/cached_UTF-8_del.kmap.gz \
    && rm -f /mnt/etc/systemd/system/multi-user.target.wants/apply_noobs_os_config.service \
    && rm -f /mnt/etc/systemd/system/multi-user.target.wants/raspberrypi-net-mods.service \
    && rm -f /mnt/etc/rc3.d/S01resize2fs_once \
    && mksquashfs /mnt converted_image_for_berryboot.img -comp lzo -e lib/modules \
    && umount /mnt \
    && kpartx -d image_you_want_to_convert.img