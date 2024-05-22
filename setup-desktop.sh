#!/bin/bash
set -e

FONT_DIR=~/.fonts # TODO use ~/.config/fonts instead?

install_fonts() {
    local url=$1
    local dest=$(mktmp)

    wget -qO $dest $url
    mkdir -p $FONT_DIR
    unzip $dest '*.ttf' -d $FONT_DIR
    rm $dest
}

install_fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip

sudo flatpak install -y https://downloads.1password.com/linux/flatpak/1Password.flatpakref
