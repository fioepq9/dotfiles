#!/usr/bin/env zsh

if ! command -v pkgx >/dev/null 2>&1; then
  curl -fsLS https://pkgx.sh | sh
fi

for pkg in $(echo "
zsh
git
curl
starship=starship.rs
nvim=neovim.io
bat
jq
yq
eza
rg=crates.io/ripgrep
fd
fzf
rsync
dog=dns.lookup.dog
gitui=crates.io/gitui
chezmoi=chezmoi.io
cargo
file=darwinsys.com/file
"); do
  cmd=$pkg; repo=$pkg
  if [[ $pkg =~ ^(.+)=(.+)$ ]]; then
    # bash
    # cmd=${BASH_REMATCH[1]}
    # repo=${BASH_REMATCH[2]}
    # zsh
    cmd=$match[1]
    repo=$match[2]
  fi
  if command -v $cmd >/dev/null 2>&1; then
    continue
  fi
  pkgx install $repo
done