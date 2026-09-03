#!/bin/bash

if command -v apt ; then
	sudo apt update
	sudo apt -y upgrade
	sudo apt clean
	sudo apt autoclean
	sudo apt -y autoremove
fi

if command -v snap ; then
	sudo snap refresh
	sudo snap set system refresh.retain=2 # Remover versões antigas automaticamente

fi

if command -v flatpak ; then
	sudo flatpak -y update
	flatpak uninstall --unused # Eq. apt autoremove
	flatpak uninstall --unused --delete-data # Eq. apt clean
fi

