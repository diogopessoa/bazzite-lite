#!/usr/bin/env bash
# ==========================================
# Bazzite Lite
# Autor: Diogo Pessoa
# Perfil: Desktop / Gaming / Distrobox
# ==========================================

set -e

echo "=========================================="
echo " Bazzite Desktop Enxuto"
echo "=========================================="
echo

# Verificação básica
if [[ $EUID -ne 0 ]]; then
  echo "Este script precisa ser executado como root."
  exit 1
fi

echo ">> Desabilitando virtualização pesada (Libvirt / Xen / VirtualBox)..."

systemctl disable \
  virtlxcd.service \
  virtqemud.service \
  virtxend.service \
  virtvboxd.service || true

echo ">> Desabilitando iSCSI (storage de rede)..."

systemctl disable \
  iscsi-onboot.service \
  iscsi-starter.service || true

echo ">> Desabilitando hugepages 1GB (não úteis para desktop)..."

systemctl disable dev-hugepages1G.mount || true

echo
echo "=========================================="
echo " Ajustes aplicados com sucesso!"
echo "=========================================="
echo
echo "Reinicie o sistema para aplicar completamente."
echo
