#!/bin/bash -xe

mknod -m660 /dev/loop18 b 7 18 &> /dev/null
touch /var/loop_device_file &> /dev/null
truncate -s 64G /var/loop_device_file &> /dev/null
losetup /dev/loop18 /var/loop_device_file &> /dev/null
