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

## deno
has deno || brew install deno

## jq
has jq || brew install jq

## exa
has exa || brew install exa
alias ls='exa --icons -l -g -h --time-style long-iso'

## neovim
has nvim || brew install neovim
export EDITOR=nvim
alias vi=nvim
alias vim=nvim

## fd
has fd || brew install fd
alias find=fd

## fzf
has fzf || brew install fzf
silent_source $ZINIT_CONFIG_HOME/fzf.zsh

## ripgrep
has rg || brew install ripgrep
alias grep='rg --no-line-number'

## bat
has bat || brew install bat
silent_source $ZINIT_CONFIG_HOME/bat.zsh

## atuin
has atuin || brew install atuin
eval "$(atuin init zsh)"

## zoxide
# has zoxide || brew install zoxide
# eval "$(zoxide init --cmd cd --hook pwd zsh)"

## bottom
has btm || brew install bottom

## httpie
has http || brew install httpie

## just
has just || brew install just

## gitui
has gitui || brew install gitui
alias g=gitui

## navi
has navi || brew install navi
eval "$(navi widget zsh)"
