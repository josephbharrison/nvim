#!/usr/bin/env bash

echo -en "Checking prereqs: "
# Verify homebrew install
res=$(brew list)
if [[ $? -ne 0 ]]; then
    echo "FAIL"
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "OK"
fi

function fail(){
    echo "FAIL"
    exit 1
}

# Install dependencies
res=$(brew list nvim)
if [[ $? -ne 0 ]]; then
    echo -en "Installing neovim: "
    brew update &> /dev/null && brew install nvim &> /dev/null && echo OK || fail
else
    echo -en "Upgrading neovim: "
    brew upgrade nvim &> /dev/null && echo OK || fail
fi

# Install fonts
echo -en "Installing fonts: "
brew tap homebrew/cask-fonts &> /dev/null
brew install --cask font-mononoki-nerd-font &> /dev/null && \
brew install --cask font-go-mono-nerd-font &> /dev/null && echo OK || fail


# Backup nvim
now=$(date +%s)
config=~/.config/nvim
[[ -d $config ]] && mv -f $config ${config}.${now}.bak

# Clone neovim config
git clone https://github.com/josephbharrison/nvim.git  ~/.config/nvim

# nvim --headless -c 'autocmd User PackerComplete quitall'
nvim -c 'autocmd User PackerComplete quitall'

