#!/usr/bin/env bash

set -xeuo pipefail

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

# jq
if ! command -v jq &> /dev/null; then
    echo -e "${BOLDGREEN}installing jq...${ENDCOLOR}"
    sudo apt install --yes jq
fi

# ripgrep
if ! command -v rg &> /dev/null; then
    echo -e "${BOLDGREEN}installing ripgrep...${ENDCOLOR}"
    sudo apt install --yes ripgrep
fi

# fd-find
if ! command -v fdfind &> /dev/null; then
    echo -e "${BOLDGREEN}installing fd-find...${ENDCOLOR}"
    sudo apt install --yes fd-find
fi

# xclip
if ! command -v xclip &> /dev/null; then
    echo -e "${BOLDGREEN}installing xclip...${ENDCOLOR}"
    sudo apt install --yes xclip
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
    pipx install pyright

    echo -e "${BOLDGREEN}installing python-lsp-server...${ENDCOLOR}"
    pipx install 'python-lsp-server[all]'
fi

# install typescript-language-server
if ! command -v typescript-language-server &> /dev/null; then
    echo -e "${BOLDGREEN}installing typescript-language-server...${ENDCOLOR}"
    sudo npm install -g typescript typescript-language-server
fi

# install robotframework_lsp server
if ! command -v robotframework_ls &> /dev/null; then
    echo -e "${BOLDGREEN}installing robotframework-lsp...${ENDCOLOR}"
    pipx install robotframework-lsp
fi

# install instant-markdown-d
if ! command -v instant-markdown-d &> /dev/null; then
    echo -e "${BOLDGREEN}installing instant-markdown-d...${ENDCOLOR}"
    sudo npm install -g instant-markdown-d
fi

# install clangd
if ! command -v clangd &> /dev/null; then
    echo -e "${BOLDGREEN}installing clangd...${ENDCOLOR}"

    clang_version=$(
        apt search clang 2> /dev/null | grep -Eo "^clang-[0-9]+/" | grep -o 'clang-[0-9]\+' | sort -V | tail -n 1
    )

    sudo apt-get install ${clang_version}
    sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/${clang_version} 100
fi

# install bash-language-server
if ! command -v bash-language-server &> /dev/null; then
    echo -e "${BOLDGREEN}installing bash-language-server...${ENDCOLOR}"
    sudo npm i -g bash-language-server
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
git clone https://github.com/eccanto/starter.git ~/.config/nvim --depth 1

# python plugins
sudo apt install --yes python3-pynvim
sudo apt install --yes python3-jedi

sudo mkdir -p /root/.config/
sudo ln -s -f ${NVIM_CONFIG} /root/.config/nvim

# setting coc package
echo -e "${BOLDGREEN}configuring coc...${ENDCOLOR}"
cp ./resources/coc-settings.json ~/.config/nvim/coc-settings.json
nvim +'CocInstall coc-json coc-tsserver coc-eslint coc-pyright coc-yaml coc-sh coc-highlight coc-pairs coc-clangd coc-java'

# end
echo -e "${BOLDGREEN}\nfinished.${ENDCOLOR}\n"
