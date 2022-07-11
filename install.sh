#!/usr/bin/env bash

set -euo pipefail

RED="31"
GREEN="32"
BOLDRED="\e[1;${RED}m"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"

NVIM_CONFIG=$(realpath ~/.config/nvim)

FONT_DIR=$(realpath ~/.fonts)

PACKER_DIR=$(realpath ~/.local)/share/nvim/site/pack/packer/start/packer.nvim

function install_nvim() {
    wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz -O- | sudo tar zxvf - -C /usr/local --strip=1

    # replace current nvim
    sudo mv /usr/bin/nvim /usr/bin/nvim_backup || true
    sudo ln -s /usr/local/bin/nvim /usr/bin/nvim

    # replace vim
    sudo mv /usr/bin/vim /usr/bin/vim_backup || true
    sudo ln -s /usr/local/bin/nvim /usr/bin/vim
}

# packer
if [[ ! -d ${PACKER_DIR} ]]; then
    echo -e "${BOLDGREEN}installing packer...${ENDCOLOR}"
    git clone https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# JetBrainsMono font
if ! ls -A ${FONT_DIR}/JetBrains*.ttf &> /dev/null; then
    echo -e "${BOLDGREEN}downloading JetBrainsMono font...${ENDCOLOR}"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -P ${FONT_DIR}

    pushd ${FONT_DIR}
        unzip JetBrainsMono.zip
        rm JetBrainsMono.zip
    popd

    fc-cache -f -v
fi

# ripgrep
if ! command -v rg &> /dev/null; then
    echo -e "${BOLDGREEN}installing ripgrep...${ENDCOLOR}"
    sudo apt install ripgrep
fi

# fd-find
if ! command -v fdfind &> /dev/null; then
    echo -e "${BOLDGREEN}installing fd-find...${ENDCOLOR}"
    sudo apt install fd-find
fi

# xclip
if ! command -v xclip &> /dev/null; then
    echo -e "${BOLDGREEN}installing xclip...${ENDCOLOR}"
    sudo apt install xclip
fi

# backup
if [[ ! -z "$(ls -A ${NVIM_CONFIG})" ]]; then
    echo "generating a backup copy of the previous nvim configuration..."
    rm -rf ${NVIM_CONFIG}.bak
    mv ${NVIM_CONFIG} ${NVIM_CONFIG}.bak
fi

# mdr
if ! command -v mdr &> /dev/null; then
    echo -e "${BOLDGREEN}installing mdr...${ENDCOLOR}"
    sudo wget https://github.com/MichaelMure/mdr/releases/download/v0.2.5/mdr_linux_amd64 -O /usr/bin/mdr
    sudo chmod +x /usr/bin/mdr
fi

# nvim
if ! command -v nvim &> /dev/null; then
    echo -e "${BOLDGREEN}installing neovim...${ENDCOLOR}"
    install_nvim
fi

NVIM_VERSION=$(nvim --version | grep -m 1 -Po 'NVIM (v[\d.]+)')
if [[ "${NVIM_VERSION}" < "NVIM v0.7.2" ]]; then
    echo -e "${BOLDGREEN}updating neovim: ${NVIM_VERSION}...${ENDCOLOR}"
    install_nvim
fi

# python plugins
pip3 install -U pynvim
pip3 install --user -U jedi

# configure nvim
echo -e "${BOLDGREEN}configuring neovim...${ENDCOLOR}"
mkdir -p ${NVIM_CONFIG}
cp -r ./nvim/* ${NVIM_CONFIG}

nvim -c "autocmd User PackerComplete quitall" -c "PackerSync"
sudo nvim -c "autocmd User PackerComplete quitall" -c "PackerSync"

sudo ln -s -f ${NVIM_CONFIG} /root/.config/nvim
sudo mkdir -p /root/.local/share/nvim/site/pack/packer/start/
sudo ln -s -f ${PACKER_DIR} /root/.local/share/nvim/site/pack/packer/start/packer.nvim

# end
echo -e "${BOLDGREEN}\nfinished.${ENDCOLOR}\n"
