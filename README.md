# penguins-eggs-old

Este repositório contém um acervo/versão antiga do projeto "penguins-eggs" — arquivos e scripts históricos que foram usados para construir imagens/instalações com a ferramenta `eggs` (Perri's Brewery edition).

Objetivo

- Documentar e preservar o estado antigo do projeto: scripts, configurações e artefatos que eram usados para criar imagens de sistema ou instaladores com a ferramenta `eggs`.
- Fornecer informações básicas de recuperação/replicação do ambiente em que eu consegui instalar e testar o projeto.

Ambiente onde eu consegui instalar/testar

- Sistema operacional: Ubuntu 22.04.5 LTS (codename: jammy)
- Pacote `eggs` (Perri's Brewery edition): versão 9.3.19
- Node.js: v12.22.9

Saída relevante do `apt show eggs` (resumida)

- Package: eggs
- Version: 9.3.19
- Maintainer: artisan <piero.proietti@gmail.com>
- Depends: coreutils, cryptsetup, curl, dosfstools, dpkg-dev, git, isolinux, live-boot, live-boot-initramfs-tools, lsb-release, lvm2, parted, pxelinux, rsync, squashfs-tools, sshfs, syslinux, syslinux-common, xorriso
- Conflicts: calamares-settings-debian, calamares-settings-ubuntu
- Suggest: calamares, qml-module-qtquick2, qml-module-qtquick-controls

Observações de instalação

- Instale as dependências do sistema via apt antes de rodar scripts que dependam de `eggs`.
- A versão de Node.js usada ao testar foi 12.22.9; algumas partes do projeto podem depender de versões antigas do Node.
- Arquivos neste repositório são históricos — podem usar ferramentas, caminhos ou opções legadas. Se planejar reutilizar qualquer script, reveja e atualize conforme necessário.

Como usar (orientação geral)

- Este repositório NÃO tem instruções passo-a-passo incorporadas (é um acervo). Antes de executar qualquer script:
  1. Leia o conteúdo dos scripts para entender dependências e ações realizadas.
  2. Garanta que as dependências listadas acima estejam instaladas no sistema.
  3. Teste em um ambiente isolado (VM ou container) para evitar alterações indesejadas no sistema principal.

Contribuição / Histórico

- O propósito principal aqui é arquivar e documentar um estado antigo do projeto. Se você quiser migrar conteúdo para um repositório ativo, recomendo criar um novo repositório e portar os arquivos relevantes, atualizando dependências e instruções de uso.

Contato

- Repositório: elppans/penguins-eggs-old

---

Se quiser, eu posso:
- Adicionar instruções passo-a-passo de instalação/uso (se você me fornecer os comandos que executou).
- Extrair e listar arquivos importantes do repositório (scripts de build, etc.).
