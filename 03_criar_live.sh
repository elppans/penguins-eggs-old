#!/bin/bash

if [ -f /etc/os-release ]; then
	. /etc/os-release
else
	echo -e "Arquivo \"os-release\" não encontrado!"
	exit 1
fi

if [ -f /etc/penguins-eggs.d/eggs.yaml ]; then
	sudo sed -i \
		-e 's/^user_opt_passwd:.*/user_opt_passwd: live/' \
		-e 's/^root_passwd:.*/root_passwd: live/' \
		-e 's/^theme:.*/theme: eggs/' \
		-e 's/^timezone:.*/timezone: America\/Sao_Paulo/' \
		/etc/penguins-eggs.d/eggs.yaml
fi

if command -v eggs; then
	# sudo eggs produce -vf --basename "$NAME"_"$VERSION_CODENAME" --theme debian
	sudo eggs produce -vm --basename "$NAME"_"$VERSION_CODENAME" --theme eggs
fi

# Temas:
# ls /usr/lib/penguins-eggs/addons/themes/
# ou
# ls /usr/lib/node_modules/penguins-eggs/addons/themes/
# ou
# ls /usr/lib/penguins-eggs/addons/
