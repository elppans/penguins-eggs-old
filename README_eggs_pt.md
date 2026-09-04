Aqui está a tradução do texto que você trouxe:

---

### Configuração do Penguin’s eggs

**Pasta `penguins-eggs.d`**  
Foi introduzida uma nova versão do arquivo de configuração, principalmente para facilitar a vida dos mantenedores de distribuições customizadas.  
Anteriormente existia o arquivo `/etc/penguins-eggs.yaml`, que agora foi renomeado para `eggs.yaml` e movido para `/etc/penguins-eggs.d`.  

Dessa forma, é possível inserir arquivos adicionais em uma posição fixa da árvore de diretórios. O *eggs* pode ser instalado de três maneiras:  
- a partir do **código-fonte**  
- como **pacote nodejs**  
- como **pacote Debian**  

Cada forma coloca os arquivos em locais diferentes da árvore.  
- Via npm: `/usr/lib/node_modules/penguins-eggs`  
- Via pacote Debian: `/usr/lib/penguins-eggs`  
- Via fonte: na pasta onde você baixou.  

Para permitir customização, foram criados links que facilitam a localização desses arquivos.

---

### Arquivo de configuração do eggs
O principal arquivo de configuração é `/etc/penguins-eggs.d/eggs.yaml`.  
Sua estrutura é semelhante a um arquivo INI, fácil de modificar pelo usuário.

---

### Arquivo de configuração do tools
O **penguins-tools** (abreviado como `pt`) é um utilitário complementar ao *eggs*.  
Ele não é essencial para criar ISOs, mas ajuda a manipular as “ovos” e desenvolver o próprio *eggs*.  
Exemplos:  
- Exportar ISOs via `scp` com `pt export:iso`.  
- Exportar/importar pacotes Debian (`pt export:deb`, `pt import:deb`).  
- Exportar documentação (`pt export:docs`).  

Para usar o `pt`, é necessário ajustar os parâmetros em `tools.yaml`.

---

### Diretório addons
Contém as extensões do *eggs* e pode ser modificado.  
Você pode criar novos temas alterando os existentes.  
⚠️ Atenção: como são links, em caso de reinstalação suas alterações podem se perder. Salve antes de atualizar.

---

### Diretório distros
Aqui ficam os templates de configuração do **Calamares**, separados por versão.  
Eles são usados para gerar os arquivos de configuração do instalador gráfico.  
Vale a mesma regra dos addons: cuidado para não perder alterações em atualizações.

---

### Ovarium
É a parte central do *eggs*, onde “as coisas ganham vida”.  
Contém 3 diretórios principais:  
- `efi`  
- `filesystem.squashfs`  
- `iso`  
E um oculto: `overlay`.  

Essa estrutura é criada conforme definido no arquivo de configuração.

- **efi**: usado para compatibilidade UEFI, com subpastas `boot` e `efi`.  
- **filesystem.squashfs**: contém todo o sistema de arquivos, montado com overlayfs para ser gravável sem afetar o sistema atual. É o que vira o sistema dentro da ISO.  
- **iso**: estrutura da imagem ISO, com:  
  - `boot` e `efi` (para UEFI)  
  - `isolinux` (arquivos de boot do livecd)  
  - `live` (contendo `vmlinuz`, `initrd.img` e `filesystem.squashfs`).

---

### Personalização antes de gerar a ISO
Se quiser mais controle, existe a flag `--dry`.  
Ela gera instantaneamente a estrutura do filesystem, da ISO e scripts relacionados (`bind`, `mksquashfs`, `mkiso`, `ubind`) sem criar a ISO final.  
Assim você pode revisar e ajustar antes de compilar.  

---

👉 Em resumo: o texto explica a nova organização dos arquivos de configuração, os diretórios usados pelo *eggs* e como você pode personalizar temas, distros e até gerar scripts antes de criar a ISO final.  
