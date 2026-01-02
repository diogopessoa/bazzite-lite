# bazzite-lite script 

# Table of Contents
- 🌐 > [🇧🇷](https://github.com/diogopessoa/bazzite-lite/blob/main/README-BR.md)
- [Table of Contentes](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#table-of-contents)
  - [About](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#about)
  - [Objectives](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#objectives)
  - [What it Modifies](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#what-it-modifies)
    - [Disabled services include:](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#disabled-services-includes)
  - [How to Use](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#how-to-uses)
    - [Script Installation](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#script-installation)
    - [Manual Installation](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#manual-installation)
    - [Revert the changes](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#revert-the-changes)
  - [When NOT to Use](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#when-not-to-use)
    - [Safes for Flatpaks](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#safe-for-flatpaks)
  - [License & Author](https://github.com/diogopessoa/bazzite-lite/?tab=readme-ov-file#license-author)  

    
## About

**Bazzite-Lite script** makes Bazzite (as well as Bluefin and Aurora) lighter and faster by disabling non-essential background components for desktop use.

All core Bazzite tools such as ujust, brew, distrobox, podman, toolbox and flatpak remain fully functional.

## Objectives

* **Faster Boot:** Reduces overhead by disabling unused systemd services.
* **Performance:** Lowers idle CPU and RAM usage.
* **Immutability Safe:** No changes to `rpm-ostree`, kernel arguments, or the base image.
* **Fully Reversible:** Re-enable everything with a single command.

## What it Modifies

The script disables specific background services to free up resources:

* **Virtualization:** Disables **Hypervisor** stacks (Libvirt, Xen, QEMU, VirtualBox).
* **Network:** Disables **Remote Storage** (iSCSI initiator) services.
* **Memory:** Disables **Static Reservation** of 1GB HugePages.

> **Note:** Systemd sockets remain untouched to ensure zero impact on system stability.


### Disabled services include:

* `virtlxcd.service`
* `virtqemud.service`
* `virtxend.service`
* `virtvboxd.service`
* `iscsi-onboot.service`
* `iscsi-starter.service`
* `dev-hugepages1G.mount`

## How to Use
### Script Installation
1. Clone the repository or download the script and save it to your ***Downloads folder**:

```bash
cd ~/Downloads
wget https://github.com/diogopessoa/bazzite-lite/blob/main/bazzite-lite.sh
```

2. Make the script executable:
   
```bash
chmod +x bazzite-lite.sh
```
   
3. Run the script as root:

```bash
sudo ./bazzite-lite.sh
```

*✅️ All done! Reboot your system after execution.* 

### Manual Installation

If you prefer to run the commands manually without a script, follow these steps:

```bash
# 1. Download the optimization script
curl -fsSL https://raw.githubusercontent.com/diogopessoa/bazzite-lite/main/bazzite-lite.sh -o bazzite-lite.sh

# 2. Make them executable
chmod +x bazzite-lite.sh

# 3. Run the optimization
sudo ./bazzite-lite.sh
```
*✅️ All done! Reboot your system after execution.* 

### Revert the changes

To revert the changes, run the following commands:

```bash
# Download the undo script
curl -fsSL https://raw.githubusercontent.com/diogopessoa/bazzite-lite/main/bazzite-lite-undo.sh -o bazzite-lite-undo.sh

# Make it executable and run
chmod +x bazzite-lite-undo.sh
sudo ./bazzite-lite-undo.sh
```

## When NOT to Use
Do **not** apply this profile if you rely on **Host-Level** services:

* **Virtualization:** System-wide **Hypervisors** (Libvirt, Xen, or VirtualBox) installed via `rpm-ostree`.
* **Storage & Memory:** **iSCSI** network storage or **1GB HugePages** reservations.

### Safe for Flatpaks

This script **will not interfere** with **Containerized Virtualization**. If you use **GNOME Boxes** or **virt-manager** via **Flatpak**, your workflow remains fully functional as they do not depend on these system-wide services.

## License & Author

**MIT License** | Author [Diogo Pessoa](https://github.com/diogopessoa)

## Credits

* **[Bazzite](https://bazzite.gg/)** 
* **[Universal Blue](https://universal-blue.org/)**
