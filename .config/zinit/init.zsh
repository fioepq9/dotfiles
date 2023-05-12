#!/bin/env zsh


# functions
has() {
	command -v "$@" >/dev/null 2>&1 && return 0 || return 1
}


# constant
export ZINIT_CONFIG_HOME="$(dirname $0)"


# XDG
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache


# proxy
[[ ! -f $ZINIT_CONFIG_HOME/proxy.zsh ]] || source $ZINIT_CONFIG_HOME/proxy.zsh


# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
[[ ! -f $ZINIT_CONFIG_HOME/zinit.zsh ]] || source $ZINIT_CONFIG_HOME/zinit.zsh

## homebrew
zinit ice cloneonly wait lucid atclone"chmod a+x ./install.sh && ./install.sh"
zinit snippet https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
[[ $OSTYPE =~ 'linux*' ]] && has /home/linuxbrew/.linuxbrew/bin/brew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## git
has git || brew install git
git config --global init.defaultBranch main

## golang
has go || brew install golang
go env -w GO111MODULE="on"
go env -w GOBIN="$(go env GOPATH)/bin"
go env -w GOPROXY="https://goproxy.cn,direct"
export PATH=$PATH:$(go env GOBIN)

## rust
has cargo || brew install rust
export PATH=$PATH:$HOME/.cargo/bin

## yadm
has yadm || brew install yadm
