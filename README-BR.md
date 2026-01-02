# Bazzite Lite

[🇬🇧](https://github.com/diogopessoa/bazzite-lite)

O script **Bazzite-Lite** torna o Bazzite (assim como o Bluefin e o Aurora) mais leve e rápido, desativando componentes de segundo plano não essenciais para uso em desktop.
Todas as ferramentas centrais do Bazzite (ujust, brew, distrobox, podman e toolbox) permanecem totalmente funcionais.

## Objetivos

* **Boot Mais Rápido:** Reduz a carga inicial ao desabilitar serviços do systemd não utilizados.
* **Desempenho:** Diminui o uso ocioso (idle) de CPU e RAM.
* **Seguro para Sistemas Imutáveis:** Sem alterações no `rpm-ostree`, argumentos de kernel ou na imagem base.
* **Totalmente Reversível:** Reative tudo com um único comando.


## O que ele modifica

O script desabilita serviços específicos para liberar recursos:

* **Virtualização:** Desabilita stacks de **Hypervisor** (Libvirt, Xen, QEMU, VirtualBox).
* **Rede:** Desabilita serviços de **Armazenamento Remoto** (iniciador iSCSI).
* **Memória:** Desabilita a **Reserva Estática** de HugePages de 1GB.

> **Nota:** Os sockets do systemd permanecem intactos para garantir a estabilidade do sistema.

### Serviços desabilitados incluem:

* `virtlxcd.service`
* `virtqemud.service`
* `virtxend.service`
* `virtvboxd.service`
* `iscsi-onboot.service`
* `iscsi-starter.service`
* `dev-hugepages1G.mount`

## Como Usar

1. Clone o repositório ou baixe o script e salve-o na sua pasta Downloads:

```bash
cd ~/Downloads
wget https://github.com/diogopessoa/bazzite-lite/blob/main/bazzite-lite.sh
```

2. Torne o script executável:

```bash
chmod +x bazzite-lite.sh
```

3. Execute o script como root:

```bash
sudo ./bazzite-lite.sh
```

*✅️ Tudo pronto! Reinicie o sistema após a execução.*

## Instalação Manual
### Reverter as alterações
Se preferir executar os comandos manualmente sem script, siga estas etapas:

```bash
# 1. Baixe o script
curl -fsSL https://raw.githubusercontent.com/diogopessoa/bazzite-lite/main/bazzite-lite.sh -o bazzite-lite.sh

# 2. Torne-o executável
chmod +x bazzite-lite.sh bazzite-lite-undo.sh

# 3. Execute como administrador (root)
sudo ./bazzite-lite.sh
```

*✅️ Tudo pronto! Reinicie o sistema após a execução.*

### Reverter mudanças

```bash
# Baixe o script
curl -fsSL https://raw.githubusercontent.com/diogopessoa/bazzite-lite/main/bazzite-lite-undo.sh -o bazzite-lite-undo.sh

# Torne-o executável e execute
chmod +x bazzite-lite-undo.sh
sudo ./bazzite-lite-undo.sh
```

## Quando NÃO usar
Não aplique este guia se você depende de serviços a **nível de host**:

* **Virtualização:** **Hypervisors** de sistema (Libvirt, Xen ou VirtualBox) instalados via `rpm-ostree`.
* **Armazenamento e Memória:** Armazenamento de rede **iSCSI** ou reservas de **HugePages de 1GB**.

### Flatpaks

Este script **não interfere** com **Virtualização via Container**. Se você usa **GNOME Boxes** ou **virt-manager** via **Flatpak**, seu fluxo de trabalho permanecerá funcional, pois eles não dependem desses serviços do sistema.

## Licença & Autor

**Licença MIT** | Autor [Diogo Pessoa](https://github.com/diogopessoa)

## Créditos

* **[Bazzite](https://bazzite.gg/)** 
* **[Universal Blue](https://universal-blue.org/)** 
