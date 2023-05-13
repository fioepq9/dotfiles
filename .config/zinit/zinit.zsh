zinit as"null" from"gh-r" wait lucid for \
light-mode \
	mv"jq* -> jq" \
	sbin"jq" \
	@stedolan/jq \
light-mode \
	sbin"bin/exa" \
	atload"alias ls='exa --icons -l -g -h --time-style long-iso'" \
	@ogham/exa \
light-mode \
	mv"nvim* -> nvim" \
	sbin"nvim/bin/nvim" \
	atload"export EDITOR=nvim; alias vi=nvim; alias vim=nvim" \
	@neovim/neovim \
light-mode \
	mv"fd* -> fd" \
	sbin"fd/fd" \
	atload"alias find=fd" \
	@sharkdp/fd \
light-mode \
	atload"[[ ! -f $ZINIT_CONFIG_HOME/fzf.zsh ]] || source $ZINIT_CONFIG_HOME/fzf.zsh" \
	sbin"fzf" \
	@junegunn/fzf \
light-mode \
	mv"ripgrep* -> ripgrep" \
	sbin"ripgrep/rg" \
	atload"alias grep='rg --no-line-number'" \
	@BurntSushi/ripgrep \
light-mode \
	mv"bat* -> bat" \
	sbin"bat/bat" \
	atload"[[ ! -f $ZINIT_CONFIG_HOME/bat.zsh ]] || source $ZINIT_CONFIG_HOME/bat.zsh" \
	@sharkdp/bat \
light-mode \
	mv"atuin* -> atuin" \
	sbin"atuin/atuin" \
	atload'eval "$(atuin init zsh)"' \
	@ellie/atuin \
light-mode \
	sbin"zoxide" \
	atload'eval "$(zoxide init --cmd cd --hook pwd zsh)"' \
	@ajeetdsouza/zoxide \
light-mode \
	sbin"btm" \
	@ClementTsang/bottom \
light-mode \
	sbin"http" \
	@httpie/httpie \
light-mode \
	sbin"just" \
	@casey/just

zinit as"null" from"gh-r" wait"linux" lucid for \
light-mode \
	has"git" \
	bpick"*musl*" \
	sbin"gitui" \
	atload"alias g=gitui" \
	@extrawurst/gitui \
light-mode \
	bpick"*x86_64*musl*" \
	sbin"navi" \
	atload'eval "$(navi widget zsh)"' \
	@denisidoro/navi

zinit as"null" from"gh-r" wait"mac" lucid for \
light-mode \
	has"git" \
	bpick"*mac*" \
	sbin"gitui" \
	atload"alias g=gitui" \
	@extrawurst/gitui \
light-mode \
	bpick"*x86_64*darwin*" \
	sbin"navi" \
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
