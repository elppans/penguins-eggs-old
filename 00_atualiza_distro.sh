#!/bin/bash

if command -v apt; then
	sudo apt update
	sudo apt -y upgrade
	sudo apt clean
	sudo apt autoclean
	sudo apt -y autoremove
fi

if command -v snap; then
	# Comando snap eq. apt autoremove
	snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do
		sudo snap remove "$snapname" --revision="$revision"
	done
	sudo snap set system refresh.retain=2 # Remover versões antigas automaticamente
	sudo snap refresh
fi

if command -v flatpak; then
	sudo flatpak -y update
	flatpak uninstall --unused -y               # Eq. apt autoremove
	flatpak uninstall --unused --delete-data -y # Eq. apt clean
fi

if command -v docker; then
	# ----------------------------------------------------------#
	# -- Script de limpeza segura para Docker Swarm e Compose --#
	# ----------------------------------------------------------#

	# Script de limpeza segura para Docker Swarm e Compose

	echo " Serviços ativos no Swarm... "
	sudo docker service ls

	echo " Containers ativos... "
	sudo docker ps

	echo " Imagens disponíveis... "
	sudo docker images

	echo " Volumes existentes... "
	sudo docker volume ls

	echo " Redes existentes... "
	sudo docker network ls

	echo ""
	echo ">>> Limpando containers parados..."
	sudo docker container prune -f

	echo ">>> Limpando imagens não utilizadas..."
	sudo docker image prune -f
	sudo docker image prune -f -a

	echo ">>> Limpando volumes órfãos..."
	sudo docker volume prune -f

	echo ">>> Limpando redes não utilizadas..."
	sudo docker network prune -f

	echo ">>> Limpando geral (sem afetar serviços ativos)..."
	sudo docker system prune -f
	sudo docker system prune --volumes -f

	# Swarm — ve as stacks ativas primeiro, e remove cada uma
	for container in $(sudo docker stack ls | grep -v 'NAME' | awk '{print $1}'); do sudo docker stack rm "$container"; done
	# sai do swarm (drena o node)
	sudo docker swarm leave --force

	# Compose — para os projetos individuais que usam compose, dentro de cada pasta do projeto
	sudo docker compose down -v --rmi all --remove-orphans

	# Limpeza geral do sistema Docker (pega tudo que sobrou solto
	# — imagens, containers parados, redes, cache de build, volumes não usados),
	# independente de ter sido criado via swarm ou compose:
	sudo docker system prune -a --volumes -f

	sudo systemctl stop docker.service
	sudo systemctl disable docker.service
	sudo systemctl stop docker.socket
	sudo systemctl disable docker.socket

	echo ""
	echo " Limpeza Docker concluída! "

fi
