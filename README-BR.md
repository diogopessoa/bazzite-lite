# bazzite-lite script 

# Table of Contents
- 🌐 > [🇬🇧](https://github.com/diogopessoa/bazzite-lite)
- [Tabela de Conteúdos](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#tabela-de-conteudos)
  - [Sobre](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#sobre)
  - [Objetivos](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#objetivos)
  - [O que ele modifica](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#o-que-ele-modifica)
    - [Serviços desabilitados](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#serviços-desabilitados)
  - [Compare](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#compare)
  - [Como Usar](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#como-usar)
    - [Script Installation](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#script-installation)
    - [Reverter mudanças](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#reverter-mudanças)
  - [Quando NÃO usar](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#quando-nao-usar)
    - [Flatpaks](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#flatpaks)
  - [Licença e Autor](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#licença-e-autor)  

    
## Sobre

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

### Serviços desabilitados

* `virtlxcd.service`
* `virtqemud.service`
* `virtxend.service`
* `virtvboxd.service`
* `iscsi-onboot.service`
* `iscsi-starter.service`
* `dev-hugepages1G.mount`

## Compare

Para ver o impacto, execute este comando **antes** e **depois** de aplicar o script bazzite-lite para comparar os resultados.

```
# copie e cole no terminal:
{
  echo "=== RELATÓRIO DE DESEMPENHO ==="
  echo "Date: $(date)"
  echo -e "\n--- TEMPO DE INICIALIZAÇÃO ---"
  systemd-analyze time
  echo -e "\n--- TOTAL DE SERVIÇOS ATIVADOS ---"
  systemctl list-unit-files --state=enabled --no-pager | grep "unit files listed" || systemctl list-unit-files --state=enabled --no-pager | wc -l
  echo -e "\n--- TOP 15 SERVIÇOS MAIS LENTOS ---"
  systemd-analyze blame | head -n 15
  echo -e "\n--- USO DE MEMÓRIA ---"
  free -h
} > ~/bazzite_benchmark_$(date +%Y%m%d_%H%M%S).txt
```

## Como Usar

```bash
# Entrar na pasta de Downloads e baixar o script
cd ~/Downloads
curl -fsSL https://raw.githubusercontent.com/diogopessoa/bazzite-lite/main/bazzite-lite.sh -o bazzite-lite.sh

# Dar permissão e executar
chmod +x bazzite-lite.sh
sudo ./bazzite-lite.sh
```

*✅️ Tudo pronto! Reinicie o sistema após a execução.*

### Reverter mudanças

```bash
curl -fsSL https://raw.githubusercontent.com/diogopessoa/bazzite-lite/main/bazzite-lite-undo.sh -o bazzite-lite-undo.sh
chmod +x bazzite-lite-undo.sh
sudo ./bazzite-lite-undo.sh
```

## Quando NÃO usar
Não aplique este guia se você depende de serviços a **nível de host**:

* **Virtualização:** **Hypervisors** de sistema (Libvirt, Xen ou VirtualBox) instalados via `rpm-ostree`.
* **Armazenamento e Memória:** Armazenamento de rede **iSCSI** ou reservas de **HugePages de 1GB**.

### Flatpaks

Este script **não interfere** com **Virtualização via Container**. Se você usa **GNOME Boxes** ou **virt-manager** via **Flatpak**, seu fluxo de trabalho permanecerá funcional, pois eles não dependem desses serviços do sistema.

## Licença e Autor

**Licença MIT** | Autor [Diogo Pessoa](https://github.com/diogopessoa)

## Créditos

* **[Bazzite](https://bazzite.gg/)** 
* **[Universal Blue](https://universal-blue.org/)** 
