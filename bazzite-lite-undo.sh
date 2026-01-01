#!/usr/bin/env bash
# ==========================================
# Bazzite Lite — UNDO
# Autor: Diogo Pessoa
# Reverte apenas os serviços desativados
# Reverts only the disabled services
# ==========================================

set -e

echo "=========================================="
echo " Bazzite Lite — UNDO"
echo "=========================================="
echo

# Verificação básica
# Basic check
if [[ $EUID -ne 0 ]]; then
  echo "Este script precisa ser executado como root."
  echo "This script must be run as root."
  exit 1
fi

echo ">> Reativando virtualização pesada (Libvirt / Xen / VirtualBox)..."
echo ">> Re-enabling heavy virtualization (Libvirt / Xen / VirtualBox)..."

systemctl enable \
  virtlxcd.service \
  virtqemud.service \
  virtxend.service \
  virtvboxd.service || true

echo ">> Reativando iSCSI (storage de rede)..."
echo ">> Re-enabling iSCSI (network storage)..."

systemctl enable \
  iscsi-onboot.service \
  iscsi-starter.service || true

echo ">> Reativando hugepages 1GB..."
echo ">> Re-enabling 1GB hugepages..."

systemctl enable dev-hugepages1G.mount || true

echo
echo "=========================================="
echo " Reversão concluída com sucesso!"
echo " Reversion completed successfully!"
echo "=========================================="
echo
echo "Reinicie o sistema para aplicar completamente."
echo "Please reboot your system to apply changes completely."
echo
