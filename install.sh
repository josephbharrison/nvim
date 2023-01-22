#!/usr/bin/env bash

# Get timestamp
now=$(date +%s)

# GLOBAL PARAMETERS
FONTS="hack mononoki go-mono jetbrains-mono"
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

function install_fonts(){
    # Install fonts
    echo -en "Installing fonts: "
    for font in $FONTS
    do
        res=$(brew list --cask font-${font}-nerd-font &> /dev/null)
        if [[ $? -ne 0 ]]; then
            sudo rm -f $HOME/Library/Fonts/${font}* &> /dev/null
            brew tap homebrew/cask-fonts &> /dev/null && 
            brew install --cask font-${font}-nerd-font &> /dev/null || return 1
        fi
    done
    return 0
}

function install_tmux(){
    # Install tmux
    res=$(brew list tmux)
    if [[ $? -ne 0 ]]; then
        echo -en "Installing tmux: "
        brew update &> /dev/null && brew install tmux &> /dev/null || return 1
    else
        echo -en "Updating tmux: "
        brew upgrade tmux &> /dev/null || return 1
    fi
    return 0
}

function install_wezterm(){
    # Install wezterm
    res=$(brew list wezterm-nightly)
    if [[ $? -ne 0 ]]; then
        echo -en "Installing wezterm: "
        brew tap wez/wezterm &> /dev/null
        brew update &> /dev/null && brew install --cask wez/wezterm/wezterm-nightly &> /dev/null || return 1
    else
        echo -en "Updating wezterm: "
        brew upgrade --cask wezterm-nightly --no-quarantine --greedy-latest &> /dev/null | return 1
    fi
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
function configure_environment(){
    echo -en "Configuring environment: "
    config_dir=${HOME}/.config
    extras_dir=${config_dir}/nvim/extras

    # Backup configuration
    [[ -d $config_dir ]] && mv -f $config_dir ${config_dir}.${now}.bak
    mv -f ~/.bash_profile ~/.bash_profile.${now}.bak

    # Create config directory
    mkdir -p $config_dir

    # Backup nvim packages
    nvim_local_dir=${HOME}/.local/share/nvim
    nvim_site_dir=${nvim_local_dir}/site
    [[ -d $nvim_site_dir ]] && mv -f $nvim_site_dir ${nvim_site_dir}.${now}.bak

    # Install nvim configuration
    nvim_config_dir=${config_dir}/nvim
    if [[ $BASE_ONLY != true ]];then
        git clone $MY_REPO $nvim_config_dir &> /dev/null || return 1
    else
        git clone $ASTRONVIM_REPO $nvim_config_dir &> /dev/null || return 1
    fi

    # Configure tmux
    mkdir -p $config_dir/tmux
    cp $extras_dir/tmux/tmux.conf $config_dir/tmux/tmux.conf 
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &> /dev/null || return 1

    # Configure wezterm
    mkdir -p $config_dir/wezterm
    cp $extras_dir/wezterm/wezterm.lua $config_dir/wezterm/wezterm.lua

    # Configure starship
    mkdir -p $config_dir/starship
    cp $extras_dir/starship/* $config_dir/starship/
    cp $extras_dir/starship/default.toml $config_dir/starship.toml

    # Configure bash
    cp $extras_dir/bash/.bash_profile ${HOME}/.bash_profile

    return 0
}

function packer_count(){
    echo $(ps -ef | grep -c "/[p]acker/")
}

function packer_sync(){
    # HEADLESS INSTALL
    echo -en "Updating packages: "
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &> /dev/null &
    while [[ $(packer_count) -gt 0 ]]
    do
        sleep 1
    done
}

function install(){
    installers="check_prereqs install_fonts install_tmux install_wezterm install_neovim configure_environment packer_sync"
    for installer in $installers
    do
        $installer && ok || fail
    done
}

install

echo
echo "Installation complete, run:"
echo
echo "  wezterm start nvim +PackerSync"
echo

