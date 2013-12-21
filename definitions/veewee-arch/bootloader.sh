#!/bin/bash

# Requires
#   pacman.sh

# Chroot into the new system and install the bootloader
arch-chroot /mnt <<ENDCHROOT
pacman -S --noconfirm syslinux
syslinux-install_update -i -a -m
sed 's|sda3|sda1|' -i /boot/syslinux/syslinux.cfg
ENDCHROOT
