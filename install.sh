#!/usr/bin/env bash

set -euo pipefail

RED="31"
GREEN="32"
BOLDRED="\e[1;${RED}m"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"

NVIM_CONFIG=$(realpath ~/.config/nvim)

function install_nvim() {
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O- | sudo tar zxvf - -C /usr/local --strip=1

    # replace current nvim
    sudo mv /usr/bin/nvim /usr/bin/nvim_backup || true
    sudo ln -s /usr/local/bin/nvim /usr/bin/nvim

    # replace vim
    sudo mv /usr/bin/vim /usr/bin/vim_backup || true
    sudo ln -s /usr/local/bin/nvim /usr/bin/vim
}

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

# mdr
if ! command -v mdr &> /dev/null; then
    echo -e "${BOLDGREEN}installing mdr...${ENDCOLOR}"
    sudo wget https://github.com/MichaelMure/mdr/releases/download/v0.2.5/mdr_linux_amd64 -O /usr/bin/mdr
    sudo chmod +x /usr/bin/mdr
fi

# install python-lsp-server
if ! python3 -c 'import pyright; print(pyright.__version__)'; then
    echo -e "${BOLDGREEN}installing pyright...${ENDCOLOR}"
    pip3 install -U pyright

    echo -e "${BOLDGREEN}installing python-lsp-server...${ENDCOLOR}"
    pip3 install -U 'python-lsp-server[all]'
fi

# install typescript-language-server
if ! command -v typescript-language-server &> /dev/null; then
    echo -e "${BOLDGREEN}installing typescript-language-server...${ENDCOLOR}"
    sudo npm install -g typescript typescript-language-server
fi

# nvim
echo -e "${BOLDGREEN}installing neovim...${ENDCOLOR}"
install_nvim

# backup
if [[ ! -z "$(ls -A ${NVIM_CONFIG})" ]]; then
    echo "generating a backup copy of the previous nvim configuration..."
    rm -rf ${NVIM_CONFIG}.bak
    mv ${NVIM_CONFIG} ${NVIM_CONFIG}.bak
fi

# uninstall previous version
echo -e "${BOLDGREEN}uninstalling previous neovim...${ENDCOLOR}"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

# copy configuration
echo -e "${BOLDGREEN}configuring neovim...${ENDCOLOR}"
git clone https://github.com/eccanto/NvChad.git ~/.config/nvim --depth 1

# python plugins
pip3 install -U pynvim
pip3 install -U jedi

sudo ln -s -f ${NVIM_CONFIG} /root/.config/nvim

# end
echo -e "${BOLDGREEN}\nfinished.${ENDCOLOR}\n"
