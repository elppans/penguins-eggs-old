#!/bin/bash

if [ -f /etc/os-release ];then
	. /etc/os-release
else
	echo -e "Arquivo \"os-release\" não encontrado!"
	exit 1
fi

if command -v eggs ;then
	sudo eggs produce -vf --basename "$NAME"_"$VERSION_CODENAME" --theme debian
fi

