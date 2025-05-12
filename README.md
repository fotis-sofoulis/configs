# Configs

---

This repository contains my configuration files, scripts and useful installation instructions.

This project was inspired by the work of [hendrikmi](https://github.com/hendrikmi/dotfiles).

## Neovim

---

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
