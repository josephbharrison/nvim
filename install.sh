#!/usr/bin/env bash


fonts="mononoki go-mono jetbrains-mono"

declare -A fontsUri
fontsUri[mononoki]='https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Mononoki/Regular/complete/mononoki-Regular%20Nerd%20Font%20Complete%20Mono.ttf'
fontsUri[go-mono]='https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Go-Mono/Regular/complete/Go%20Mono%20Nerd%20Font%20Complete.ttf'
fontsUri[jetbrains-mono]='https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/NoLigatures/Regular/complete/JetBrains%20Mono%20NL%20Regular%20Nerd%20Font%20Complete%20Mono.ttf'


# Clone neovim config
ASTRONVIM_REPO=https://github.com/AstroNvim/AstroNvim
AYU_REPO=https://github.com/Shatur/neovim-ayu.git
MY_REPO=https://github.com/josephbharrison/nvim

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

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # ...
    PACKAGE_MANAGER="apt"
    function init() {
        declare -A osInfo;
        osInfo[/etc/redhat-release]=yum
        osInfo[/etc/arch-release]=pacman
        osInfo[/etc/gentoo-release]=emerge
        osInfo[/etc/SuSE-release]=zypp
        osInfo[/etc/debian_version]=apt-get
        osInfo[/etc/alpine-release]=apk

        for f in ${!osInfo[@]}
        do
            if [[ -f $f ]];then
                echo Package manager: ${osInfo[$f]}
                PACKAGE_MANAGER=${osInfo[$f]}
                $PACKAGE_MANAGER update
            fi
        done
    }

    function installDeps() {
        $PACKAGE_MANAGER install -y fuse libfuse2

        if ! command -v sudo &> /dev/null
        then
            echo "Installing Sudo"
            $PACKAGE_MANAGER install -y sudo
        fi

        if ! command -v gcc &> /dev/null
        then
            echo "Installing GCC"
            $PACKAGE_MANAGER install -y gcc g++
        fi

        if ! command -v wget &> /dev/null
        then
            echo "Installing Wget"
            $PACKAGE_MANAGER install -y wget
        fi

        if ! command -v curl &> /dev/null
        then
            echo "Installing Curl"
            $PACKAGE_MANAGER install -y git
        fi

        if ! command -v nvim &> /dev/null
        then
            echo "Installing NeoVim"
            wget "https://github.com/neovim/neovim/releases/download/stable/nvim.appimage"
            sudo mv nvim.appimage /bin/nvim
            sudo chmod a+x /bin/nvim
        fi

        if ! command -v git &> /dev/null
        then
            echo "Installing Git"
            $PACKAGE_MANAGER install -y git
        fi
    }

    function installFonts() {
        # Install fonts
        mkdir -p ~/.fonts
        for font in $fonts
        do
            echo -en "Checking font ${font}: "
            if [ ! -f ~/.fonts/${font}\ Nerd\ Fonts.ttf ]
            then
                echo "MISSING"
                echo -en "Installing font $font:    \n"
                wget "${fontsUri[$font]}" -o ~/.fonts/${font}\ Nerd\ Fonts.ttf
            else
                ok
            fi
        done
    }

    function configure_neovim(){
        # Create base config if needed
        base=~/.config
        mkdir -p $base

        # Backup existing 
        now=$(date +%s)
        config=${base}/nvim
        [[ -d $config ]] && mv -f $config ${config}.${now}.bak
        
        # Install configuration
        if [[ $BASE_ONLY != true ]];then
            git clone $MY_REPO $config || return 1
        else
            git clone $ASTRONVIM_REPO $config || return 1
        fi

        mkdir neovim-ayu
        git clone $AYU_REPO neovim-ayu
        cp -R neovim-ayu/* $config

        return 0
    }

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    function init() {
        # Verify homebrew install
        echo -en "Checking prereqs: "
        res=$(brew list)
        if [[ $? -ne 0 ]]; then
            echo "MISSING"
            echo "Installing homebrew"
            /bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            echo "OK"
        fi
    }

    function installDeps(){
        # Install dependencies
        res=$(brew list nvim)
        if [[ $? -ne 0 ]]; then
            echo -en "Installing neovim: "
            brew update &> /dev/null && brew install nvim &> /dev/null && ok || fail
        else
            echo -en "Upgrading neovim: "
            brew upgrade nvim &> /dev/null && ok || muddle
        fi
    }

    function installFonts(){
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
    }

    # Configure NeoVim
    function configure_neovim(){
        # Create base config if needed
        base=~/.config
        mkdir -p $base

        # Backup existing 
        now=$(date +%s)
        config=${base}/nvim
        [[ -d $config ]] && mv -f $config ${config}.${now}.bak
        
        # Install configuration
        if [[ $BASE_ONLY != true ]];then
            git clone $MY_REPO $config || return 1
        else
            git clone $ASTRONVIM_REPO $config || return 1
        fi

        return 0
    }
fi

# install base configuration only
[[ $1 == "base" ]] && BASE_ONLY=true

init
installDeps
installFonts

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

