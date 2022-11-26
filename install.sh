#!/usr/bin/env bash

fonts="mononoki go-mono jetbrains-mono"

# Clone neovim config
ASTRONVIM_REPO=https://github.com/AstroNvim/AstroNvim
MY_REPO=https://raw.githubusercontent.com/josephbharrison/nvim

# install base configuration only
[[ $1 == "base" ]] && BASE_ONLY=true

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
for font in $fonts
do
    echo -en "Checking font ${font}: "
    res=$(brew list --cask font-${font}-nerd-font &> /dev/null)
    if [[ $? -ne 0 ]]; then
        echo "MISSING"
        echo -en "Installing font $font: "
        sudo rm -f /Users/work/Library/Fonts/${font}* &> /dev/null
        brew tap homebrew/cask-fonts &> /dev/null && 
        brew install --cask font-${font}-nerd-font &> /dev/null && echo OK || fail
    else
        echo OK
    fi
done


# Configure NeoVim
function configure_neovim(){
    # Backup nvim
    echo -en "Configuring neovim: "
    now=$(date +%s)
    config=~/.config/nvim

    [[ -d $config ]] && mv -f $config ${config}.${now}.bak
    # Install configuration
    git clone $ASTRONVIM_REPO ~/.config/nvim || return 1

    if [[ $BASE_ONLY != true ]];then
        mkdir -p ~/.config/nvim/lua/user
        curl -fsS ${MY_REPO}/HEAD/init.lua -o ~/.config/nvim/init.lua || return 1
        curl -fsS ${MY_REPO}/HEAD/lua/user/init.lua -o ~/.config/nvim/lua/user/init.lua || return 1
    fi

    return 0
}

configure_neovim && echo OK || fail 

# HEADLESS INSTALL
# nvim --headless -c 'autocmd User PackerComplete quitall'
# INTERACTIVE INSTALL
# nvim -c 'autocmd User PackerComplete quitall'

echo
echo "Installation complete, run:"
echo
echo "    nvim +PackerSync"
echo 

