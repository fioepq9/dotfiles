zinit ice depth"1" atload"silent_source $ZINIT_CONFIG_HOME/p10k.zsh"
zinit light @romkatv/powerlevel10k

zinit depth"1" lucid for \
light-mode \
    @jeffreytse/zsh-vi-mode \
light-mode \
	wait"has fzf" \
	@Aloxaf/fzf-tab

zinit wait lucid for \
atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    @zdharma-continuum/fast-syntax-highlighting \
blockf \
    @zsh-users/zsh-completions \
atload"!_zsh_autosuggest_start" \
    @zsh-users/zsh-autosuggestions
