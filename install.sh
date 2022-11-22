#!/usr/bin/env bash

# Install dependencies
res=$(brew list nvim)
if [[ $? -ne 0 ]]; then
    brew update && install nvim || exit 1
else
    brew upgrade nvim &> /dev/null
fi

# Install fonts
brew tap homebrew/cask-fonts &> /dev/null
brew install --cask font-mononoki-nerd-font &> /dev/null
brew install --cask font-go-mono-nerd-font &> /dev/null

# Backup nvim
now=$(date +%s)
config=~/.config/nvim
[[ -d $config ]] && mv -f $config ${config}.${now}.bak

# Clone neovim config
git clone https://github.com/josephbharrison/nvim.git  ~/.config/nvim

# nvim --headless -c 'autocmd User PackerComplete quitall'
nvim -c 'autocmd User PackerComplete quitall'

