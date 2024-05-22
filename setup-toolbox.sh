#!/bin/bash
toolbox create -y
toolbox run sh <<-__EOF__
    set -ex
    test ! -d /nix
    test ! -d ~/.config/nix
    test ! -d ~/.nix-profile

    bash <(curl -L https://nixos.org/nix/install) --no-daemon
    mkdir -p ~/.config/nix
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
    source ~/.nix-profile/etc/profile.d/nix.sh

    cd \$(mktemp -d)
    git clone https://github.com/maxouverzou/devcontainers-dotfiles
    cd devcontainers-dotfiles
    bash install.sh

    nix profile install \
        nixpkgs#helix \
        nixpkgs#tmux \
        nixpkgs#htop
__EOF__
