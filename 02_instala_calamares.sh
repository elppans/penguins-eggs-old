#!/bin/bash

if command -v eggs ;then
	sudo eggs calamares -i -v
	sudo apt -y install calamares-settings-ubuntu-common
fi
