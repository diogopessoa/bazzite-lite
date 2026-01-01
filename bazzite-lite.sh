#!/usr/bin/env bash
# ==========================================
# Bazzite Lite
# Author: Diogo Pessoa
# Profile: Desktop / Gaming / Distrobox
# ==========================================

set -e

echo "=========================================="
echo " Bazzite Lite Optimization"
echo "=========================================="
echo

# Basic check
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

echo ">> Disabling heavy virtualization (Libvirt / Xen / VirtualBox)..."

systemctl disable \
  virtlxcd.service \
  virtqemud.service \
  virtxend.service \
  virtvboxd.service || true

echo ">> Disabling iSCSI (network storage)..."

systemctl disable \
  iscsi-onboot.service \
  iscsi-starter.service || true

echo ">> Disabling 1GB hugepages (not required for desktop use)..."

systemctl disable dev-hugepages1G.mount || true

echo
echo "=========================================="
echo " Adjustments applied successfully!"
echo "=========================================="
echo
echo "Please reboot your system to apply changes completely."
echo
