# fedora-atomic-setup

Janky setup scripts for fedora atomic desktops

## Usage
- Perform base install
- update distro & reboot
- run scripts in order:
  - setup-host.sh
  - setup-desktop.sh
  - setup-vscode.sh
  - setup-toolbox.sh
  - sync-dotfiles.sh
- reboot

## Post-setup checklist
- [x] 1password login, export & fix ssh key
- [x] Login to tailscale
- [ ] Configure [syncthing](http://localhost:8384/) & [firewalld](https://docs.syncthing.net/users/firewall.html#firewalld)
- [ ] Enable rsync-backup
- [x] Setup firefox
  - Sign in
  - Sync settings & extensions
  - Sign in to containers sync
- Setup vscode
  - Sign in
  - [Update keyring settings](https://code.visualstudio.com/docs/editor/settings-sync#_troubleshooting-keychain-issues)?
  - Ensure `"dev.containers.dockerPath": "/app/tools/podman/bin/podman-remote"`

## TODO
- detect toolbox in sync-dotfiles (and fail)
- dotfile diff
- sudo mount.nfs -o users nas.local:/volume1/NetBackup Backup/

## dev instructions
$ nix flake init --template github:cachix/devenv

## known issues
vscode does not uses fish

