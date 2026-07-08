#!/bin/bash

sudo apt update

sudo apt install -y nfs-kernel-server nfs-common

sudo mkdir -p /shared

sudo cp lab_file/shared-file.txt /shared/

sudo chmod 777 /shared

sudo cp server/exports.conf /etc/exports

sudo exportfs -ra

sudo systemctl restart nfs-kernel-server

showmount -e localhost

sudo mkdir -p /mnt/nfs-share

sudo mount -t nfs localhost:/shared /mnt/nfs-share

ls -l /mnt/nfs-share

cat /mnt/nfs-share/shared-file.txt

sudo umount /mnt/nfs-share
