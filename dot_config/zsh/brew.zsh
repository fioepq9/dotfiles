#!/usr/bin/env zsh

if ! command -v brew >/dev/null 2>&1; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

__dotfiles_homebrew_on_linux() {
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
}
__dotfiles_homebrew_on_mac() {
  UNAME_MACHINE="$(/usr/bin/uname -m)"
  if [[ "${UNAME_MACHINE}" == "arm64" ]]
  then
      # On ARM macOS, this script installs to /opt/homebrew only
      HOMEBREW_PREFIX="/opt/homebrew"
  else
      # On Intel macOS, this script installs to /usr/local only
      HOMEBREW_PREFIX="/usr/local"
  fi
  eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
}
case "$OSTYPE" in
  linux*)         __dotfiles_homebrew_on_linux ;;
  darwin*)        __dotfiles_homebrew_on_mac ;;
esac

for pkg in $(echo "
gcc
zsh
git
curl
chezmoi
nvim=neovim
websocat
starship
bat
jq
yq
eza
rg=ripgrep
fd
fzf
gitui
file
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
  brew install $repo
done