if has fd; then
  export FZF_CTRL_T_COMMAND='fd --strip-cwd-prefix --type file --follow --hidden --exclude .git --color=always'
  export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix --type file --follow --hidden --exclude .git --color=always'
fi
export FZF_DEFAULT_OPTS='--ansi'