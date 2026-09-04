#!/bin/bash

pacote='eggs_9.3.19_amd64.deb'

if command -v apt ; then
	#sudo apt update
	#sudo apt upgrade

# Dependências:
sudo apt install cryptsetup cryptsetup-initramfs \
ipxe isolinux \
live-boot live-boot-doc live-boot-initramfs-tools live-config-systemd live-tools \
pxelinux sshfs

sudo apt install xorriso isolinux grub-pc-bin

# Aplicativo
sudo cp -fv "$pacote" /var/cache/apt/archives/
sudo apt install /var/cache/apt/archives/"$pacote"
sudo apt -f install
# sudo dpkg --force-all -i "$pacote"

sudo apt clean
sudo apt autoclean
sudo apt autoremove
fi

