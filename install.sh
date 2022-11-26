#!/usr/bin/env bash

# Clone neovim config
if [[ $1 == base ]];then
    REPO=https://github.com/AstroNvim/AstroNvim
else
    REPO=https://github.com/josephbharrison/nvim.git
fi

# Verify homebrew install
echo -en "Checking prereqs: "
res=$(brew list)
if [[ $? -ne 0 ]]; then
    echo "MISSING"
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "OK"
fi

function fail(){
    echo "FAIL"
    exit 1
}

function muddle(){
    echo "FAIL"
}

# Install dependencies
res=$(brew list nvim)
if [[ $? -ne 0 ]]; then
    echo -en "Installing neovim: "
    brew update &> /dev/null && brew install nvim &> /dev/null && echo OK || fail
else
    echo -en "Upgrading neovim: "
    brew upgrade nvim &> /dev/null && echo OK || muddle
fi

# Install fonts
echo -en "Checking fonts: "
res=$(brew list --cask font-mononoki-nerd-font font-go-mono-nerd-font &> /dev/null)
if [[ $? -ne 0 ]]; then
    echo "MISSING"
    echo -en "Installing fonts: "
    rm -f /Users/work/Library/Fonts/mononoki*
    rm -f /Users/work/Library/Fonts/Go\ *
    brew tap homebrew/cask-fonts &> /dev/null && 
    brew install --cask font-mononoki-nerd-font &> /dev/null && \
    brew install --cask font-go-mono-nerd-font &> /dev/null && echo OK || fail
else
    echo OK
fi


# Backup nvim
echo -en "Configuring neovim: "
now=$(date +%s)
config=~/.config/nvim
[[ -d $config ]] && mv -f $config ${config}.${now}.bak

# Install configuration
git clone $REPO ~/.config/nvim &> /dev/null && echo OK || fail

# HEADLESS INSTALL
# nvim --headless -c 'autocmd User PackerComplete quitall'
# INTERACTIVE INSTALL
# nvim -c 'autocmd User PackerComplete quitall'

echo
echo "Installation complete, run:"
echo
echo "    nvim +PackerSync"
echo 

