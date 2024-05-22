#!/bin/bash
set -xe

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub \
    com.visualstudio.code \
    com.visualstudio.code.tool.podman

systemctl --user enable --now podman.socket
sudo flatpak override --filesystem=xdg-run/podman com.visualstudio.code

# wayland issues
# - wrong icon
# - cannot login to GH

mkdir -p ~/Projects
sudo chcon -Rt svirt_sandbox_file_t ~/Projects
