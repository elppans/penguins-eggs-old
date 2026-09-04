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

if command -v docker ; then
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

echo ""
echo " Limpeza Docker concluída! "

fi
