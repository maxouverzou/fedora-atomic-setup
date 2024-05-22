#!/bin/bash
set -e

# yum repos setup
# sudo ostree remote add tailscale https://pkgs.tailscale.com/stable/fedora/tailscale.repo
sudo curl -s https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o /etc/yum.repos.d/tailscale.repo > /dev/null # is this how it should be done?


# install packages, in one operation
sudo rpm-ostree install --apply-live -y \
    distrobox \
    foot \
    iscsi-initiator-utils \
    syncthing \
    tailscale

sudo systemctl enable --now tailscaled
systemctl --user enable --now syncthing

# link network-online to user systemd
systemctl --user link $(systemctl show --property FragmentPath network-online.target | cut -d\= -f2)
