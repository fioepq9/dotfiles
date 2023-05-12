zinit as"program" from"gh-r" wait lucid for \
light-mode \
	mv"jq* -> jq" \
	@stedolan/jq \
light-mode \
	pick"bin/exa" \
	atload"alias ls='exa --icons -l -g -h --time-style long-iso'" \
	@ogham/exa \
light-mode \
	mv"nvim* -> nvim" \
	pick"nvim/bin/nvim" \
	atload"export EDITOR=nvim; alias vi=nvim; alias vim=nvim" \
	@neovim/neovim \
light-mode \
	mv"fd* -> fd" \
	pick"fd/fd" \
	atload"alias find=fd" \
	@sharkdp/fd \
light-mode \
	atload"[[ ! -f $ZINIT_CONFIG_HOME/fzf.zsh ]] || source $ZINIT_CONFIG_HOME/fzf.zsh" \
	@junegunn/fzf \
light-mode \
	mv"ripgrep* -> ripgrep" \
	pick"ripgrep/rg" \
	atload"alias grep='rg --no-line-number'" \
	@BurntSushi/ripgrep \
light-mode \
	mv"bat* -> bat" \
	pick"bat/bat" \
	atload"[[ ! -f $ZINIT_CONFIG_HOME/bat.zsh ]] || source $ZINIT_CONFIG_HOME/bat.zsh" \
	@sharkdp/bat \
light-mode \
	mv"atuin* -> atuin" \
	pick"atuin/atuin" \
	atload'eval "$(atuin init zsh)"' \
	@ellie/atuin \
light-mode \
	atload'eval "$(zoxide init --cmd cd --hook pwd zsh)"' \
	@ajeetdsouza/zoxide \
light-mode \
	@ClementTsang/bottom \
light-mode \
	@httpie/httpie \
light-mode \
	@casey/just

zinit as"program" from"gh-r" wait"[[ $OSTYPE =~ 'linux*' ]]" lucid for \
light-mode \
	has"git" \
	bpick"*musl*" \
	atload"alias g=gitui" \
	@extrawurst/gitui \
light-mode \
	bpick"*x86_64*musl*" \
	atload'eval "$(navi widget zsh)"' \
	@denisidoro/navi

zinit as"program" from"gh-r" wait"[[ $OSTYPE =~ 'darwin*' ]]" lucid for \
light-mode \
	has"git" \
	bpick"*mac*" \
	atload"alias g=gitui" \
	@extrawurst/gitui \
light-mode \
	bpick"*x86_64*darwin*" \
	atload'eval "$(navi widget zsh)"' \
	@denisidoro/navi

zinit ice depth"1" atload"[[ ! -f $ZINIT_CONFIG_HOME/p10k.zsh ]] || source $ZINIT_CONFIG_HOME/p10k.zsh"
zinit light @romkatv/powerlevel10k

zinit for \
light-mode \
    @jeffreytse/zsh-vi-mode \
light-mode \
	wait"has fzf" lucid \
	@Aloxaf/fzf-tab \

zinit wait lucid for \
atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    @zdharma-continuum/fast-syntax-highlighting \
blockf \
    @zsh-users/zsh-completions \
atload"!_zsh_autosuggest_start" \
    @zsh-users/zsh-autosuggestions
