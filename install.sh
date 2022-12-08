#!/usr/bin/env bash

# GLOBAL PARAMETERS
FONTS="mononoki go-mono jetbrains-mono"
ASTRONVIM_REPO=https://github.com/AstroNvim/AstroNvim
MY_REPO=https://github.com/josephbharrison/nvim

# install base configuration only
[[ $1 == "base" ]] && echo "Installing base astronvim only" && BASE_ONLY=true

# Verify homebrew install
function check_prereqs(){
    echo -en "Checking prereqs: "
    res=$(brew list)
    if [[ $? -ne 0 ]]; then
        echo "MISSING"
        echo "Installing homebrew: "
        /bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

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

function install_fonts(){
    # Install fonts
    echo -en "Installing fonts: "
    for font in $FONTS
    do
        res=$(brew list --cask font-${font}-nerd-font &> /dev/null)
        if [[ $? -ne 0 ]]; then
            sudo rm -f /Users/work/Library/Fonts/${font}* &> /dev/null
            brew tap homebrew/cask-fonts &> /dev/null && 
            brew install --cask font-${font}-nerd-font &> /dev/null || return 1
        fi
    done
    return 0
}

function install_neovim(){
    # Install dependencies
    res=$(brew list nvim)
    if [[ $? -ne 0 ]]; then
        echo -en "Installing neovim: "
        brew update &> /dev/null && brew install nvim &> /dev/null || return 1
    else
        echo -en "Updating neovim: "
        brew upgrade nvim &> /dev/null || return 1
    fi
    return 0
}

# Configure NeoVim
function configure_neovim(){
    echo -en "Configuring neovim: "

    # Create base config if needed
    now=$(date +%s)
    config_dir=${HOME}/.config
    mkdir -p $config_dir

    # Backup nvim configuration
    nvim_config_dir=${config_dir}/nvim
    [[ -d $nvim_config_dir ]] && mv -f $nvim_config_dir ${nvim_config_dir}.${now}.bak

    # Backup nvim packages
    nvim_local_dir=${HOME}/.local/share/nvim
    nvim_site_dir=${nvim_local_dir}/site
    [[ -d $nvim_site_dir ]] && mv -f $nvim_site_dir ${nvim_site_dir}.${now}.bak

    # Install nvim configuration
    if [[ $BASE_ONLY != true ]];then
        git clone $MY_REPO $nvim_config_dir &> /dev/null || return 1
    else
        git clone $ASTRONVIM_REPO $nvim_config_dir &> /dev/null || return 1
    fi
    
    return 0
}

function packer_sync(){
    # HEADLESS INSTALL
    echo -en "Updating packages: "
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &> /dev/null &
    sleep 5
}

function install(){
    installers="check_prereqs install_fonts install_neovim configure_neovim packer_sync"
    for installer in $installers
    do
        $installer && ok || fail
    done
}

install

echo
echo "Installation complete, run:"
echo
echo "    nvim +PackerSync"
echo 

