#!/bin/bash

if [ -f /etc/os-release ]; then
	# shellcheck disable=SC1091
	. /etc/os-release
else
	echo -e "Arquivo \"os-release\" não encontrado!"
	exit 1
fi

if [ -f /etc/penguins-eggs.d/eggs.yaml ]; then
	sudo sed -i \
		-e 's/^snapshot_prefix:.*/snapshot_prefix: ubuntu/' \
		-e 's/^user_opt_passwd:.*/user_opt_passwd: live/' \
		-e 's/^root_passwd:.*/root_passwd: live/' \
		-e 's/^compression:.*/compression: zstd -b 256K -Xcompression-level 20/' \
		-e 's/^theme:.*/theme: eggs/' \
		-e 's/^timezone:.*/timezone: America\/Sao_Paulo/' \
		-e 's/^locales_default:.*/locales_default: pt_BR.UTF-8/' \
		/etc/penguins-eggs.d/eggs.yaml
fi

if [ -f /etc/penguins-eggs.d/krill.yaml ]; then
	sudo sed -i \
		-e "s/^language:.*/language: 'pt_BR.UTF-8'/" \
		-e "s/^region:.*/region: 'America'/" \
		-e "s/^zone:.*/zone: 'Sao_Paulo'/" \
		-e "s/^keyboardLayout:.*/keyboardLayout: 'br'/" \
		-e "s/^name:.*/name: 'live'/" \
		-e "s/^password:.*/password: 'live'/" \
		-e "s/^rootPassword:.*/rootPassword: 'live'/" \
		/etc/penguins-eggs.d/krill.yaml
fi

if command -v eggs; then
	# sudo eggs produce -vf --basename "$NAME"_"$VERSION_CODENAME" --theme debian
	sudo eggs produce -vm --basename "$NAME"_"$VERSION_CODENAME"
fi

# Temas:
# ls /usr/lib/penguins-eggs/addons/themes/
# ou
# ls /usr/lib/node_modules/penguins-eggs/addons/themes/
# ou
# ls /usr/lib/penguins-eggs/addons/
