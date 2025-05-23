# Configs

This repository contains my configuration files, scripts and useful installation instructions.

This project was inspired by the work of [hendrikmi](https://github.com/hendrikmi/dotfiles).

## Neovim

### Installation

- **On an older version?** Upgrade to `Neovim v0.11+` for full compatibility with this repository.
- **First-time install?** Use the instructions [official v0.11.1 release](https://github.com/neovim/neovim/releases/tag/v0.11.1).
- **Building from source?** Consider this [link](https://infotechys.com/install-neovim-on-ubuntu-24-04/) and run the following commands on your terminal:

```bash
# Check if you have all dependencies
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip git curl doxygen -y
# Clone the neovim release repo and cd into it
git clone https://github.com/neovim/neovim.git && cd neovim
# Checkout on stable(v0.11.1) and make install
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
# Check the version to confirm installation:
nvim --version
```

### Setup Details

This configuration uses **Lazy.nvim** with a modified [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) base.

I recommend following the video tutorial from **hendrikmi** -> [Full Neovim Setup from Scratch in 2025](https://youtu.be/KYDG3AHgYEs?si=CC1vhtPelHP7AC5V).

The key plugins included as of right now are:

- Colortheme: `catppuccin`
- Starting Screen: `alpha`
- Statusline: `lualine`
- Tabs: `bufferline`
- Syntax Highlights: `treesitter`
- Search: `telescope`
- LSP setup: `lsp`, `autocompletion`, `autoformatting`
- Utilities/QoL: `comments`, `gitsigns`, `indent-blankline`
- More to come...

## Linux Hypervisor Setup

This configuration serves as the foundation for a homelab environment. For Ubuntu-based systems, install these required packages:

```bash
sudo apt update
sudo apt -y install \
  bridge-utils \
  libvirt-clients \
  libvirt-daemon-system \
  qemu \
  qemu-kvm \
  cpu-checker \
  virt-manager \
  virtinst
```

### Post installation

1. Verify kvm support:

```bash
kvm-ok
```

2. Check libvirtd status and if inactive start it:

```bash
sudo systemctl status libvirtd
sudo systemctl start libvirtd
# sudo systemctl enable libvirtd # Enable if you want it to start on computer startup
```

3. Adjust ownership and user permissions for libvirtd \
*Note: The exact commands may vary depending on your Linux distribution.*

```bash
sudo cp -rv /etc/libvirt/libvirt.conf ~/.config/libvirt/
chown $USER:$USER ~/.config/libvirt/libvirt.conf
# Additionally, add the current user to the libvirtd group for proper permissions
sudo usermod -aG libvirt $USER                               
```

4. Activate group changes: \
*Note: If issues persist, reboot as a last resort.*

```bash
su - $USER
id | grep libvirt # Verify the group is now listed
```
