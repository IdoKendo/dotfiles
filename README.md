# dotfiles
My personal dotfiles

## Pre-requisite (MacOS)
1. Install xcode: `xcode-select --install`
2. Install rosetta: `softwareupdate --install-rosetta`
3. Install nix determinate
4. Install nix-darwin

## Pre-requisite (NixOS)
1. Open a nix shell with the required utilities: `nix-shell -p git stow neovim`
2. Open the configuration file: `nvim /etc/nixos/configuration.nix`
3. Enable flakes by adding: `nix.settings.experimental-features = [ "nix-command" "flakes" ];`
4. Run: `sudo nixos-rebuild switch`
5. Copy `hardware-configuration.nix` into the git's nix directory. **Don't reuse the existing one.**

## Pre-requisite (Only for a new machine)
1. Generate SSH key: `ssh-keygen -t ed25519 -C "your_email@gmail.com"`
2. Start the SSG agent in the background: `eval "$(ssh-agent -s)"`
3. Add the SSH private key: `ssh-add ~/.ssh/id_ed25519`
4. Login to GitHub and add the public key

## Installation
1. Open a nix shell with the required utilities: `nix-shell -p git stow neovim`
2. Clone the repo: `git clone --recurse-submodules git@github.com:IdoKendo/dotfiles.git ~/.dotfiles`
3. Extract the files: `cd ~/.dotfiles && for dir in */; do stow "$dir"; done`
4. Activate the nix flake: `cd ~/.config/flake && nix run nix-darwin -- switch --flake .`
5. Open a new normal user shell, then provision the configured Mise tools: `mise install --yes`
6. Run the Mise bootstrap command: `mise bootstrap --yes`

## AWS SSO
In order to set up AWS SSO without breaking XDG spec:
```zsh
aws-sso login
aws-sso cache
aws-sso setup profiles --aws-config "$AWS_CONFIG_FILE" --force
```
