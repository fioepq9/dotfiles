#!/usr/bin/env bash
curl -fsLS https://pkgx.sh | sh

pkgx install fish
pkgx install starship.rs
pkgx install git
pkgx install neovim.io
pkgx install curl
pkgx install bat
pkgx install jq
pkgx install yq
pkgx install eza
pkgx install crates.io/ripgrep
pkgx install fd
pkgx install fzf
pkgx install rsync
pkgx install dns.lookup.dog
pkgx install crates.io/gitui
pkgx install chezmoi.io

pkgx install cargo
cargo install --locked atuin
cargo install --locked navi

rsync -a src/ ~/.local/share/chezmoi
chezmoi apply

