# dotfiles
My personal dotfiles

## Pre-requisite (MacOS)
1. Install xcode: `xcode-select --install`
2. Install rosetta: `softwareupdate --install-rosetta`
3. Install nix determinate
4. Install nix-darwin

## Pre-requisite (NixOS)
1. None

## Installation
1. Use `nix-shell -p git` to clone the repo: `git clone --recurse-submodules git@github.com:IdoKendo/dotfiles.git ~/.dotfiles`
2. Use `nix-shell -p stow` to extract the files: `cd ~/.dotfiles && for dir in */; do stow "$dir"; done`
3. Activate the nix flake: `cd ~/.config/nix-darwin && darwin-rebuild switch --flake .`
4. Activate home-manager: `cd ~/.config/nix-darwin && home-manager switch --flake . -b backup`
