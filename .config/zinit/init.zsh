#!/bin/env zsh
# functions
has() {
	command -v "$@" >/dev/null 2>&1 && return 0 || return 1
}
retry() {
	until "$@"; do sleep 1; done
}
silent_source() {
	[[ ! -f "$@" ]] || source "$@"
}
alias linux="[[ $OSTYPE =~ 'linux*' ]]"
alias mac="[[ $OSTYPE =~ 'darwin*' ]]"

# constant
export ZINIT_CONFIG_HOME="$(dirname $0)"

# XDG
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# proxy
silent_source $ZINIT_CONFIG_HOME/proxy.zsh

# brew
silent_source $ZINIT_CONFIG_HOME/brew.zsh

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
zinit light zdharma-continuum/zinit-annex-bin-gem-node
export PATH=$PATH:$ZPFX/bin
zinit light zdharma-continuum/zinit-annex-patch-dl
silent_source $ZINIT_CONFIG_HOME/zinit.zsh
