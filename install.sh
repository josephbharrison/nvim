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

function ok(){
    echo "OK"
}

function muddle(){
    echo "FAIL"
}

# Install dependencies
res=$(brew list nvim)
if [[ $? -ne 0 ]]; then
    echo -en "Installing neovim: "
    brew update &> /dev/null && brew install nvim &> /dev/null && ok || fail
else
    echo -en "Upgrading neovim: "
    brew upgrade nvim &> /dev/null && ok || muddle
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
        brew install --cask font-${font}-nerd-font &> /dev/null && ok || fail
    else
        ok
    fi
done


# Configure NeoVim
function configure_neovim(){
    # Backup nvim
    now=$(date +%s)
    base=~/.config
    config=${base}/nvim
    [[ -d $config ]] && mv -f $config ${config}.${now}.bak
    # Install configuration
    mkdir -p $base
    git clone $ASTRONVIM_REPO $config || return 1

    if [[ $BASE_ONLY != true ]];then
        mkdir -p ~/.config/nvim/lua/user
        curl -fsS ${MY_REPO}/HEAD/init.lua -o ${config}/init.lua || return 1
        curl -fsS ${MY_REPO}/HEAD/lua/user/init.lua -o ${config}/lua/user/init.lua || return 1
        curl -fsS ${MY_REPO}/HEAD/lua/default_theme/init.lua -o ${config}/lua/default_theme/init.lua || return 1
    fi

    return 0
}

echo -en "Configuring neovim: "
configure_neovim &> /dev/null && ok || fail 

# HEADLESS INSTALL
# nvim --headless -c 'autocmd User PackerComplete quitall'
# INTERACTIVE INSTALL
# nvim -c 'autocmd User PackerComplete quitall'

echo
echo "Installation complete, run:"
echo
echo "    nvim +PackerSync"
echo 

