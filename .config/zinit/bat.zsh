alias cat='bat --paging=never --plain'
help() {
  "$@" --help 2>&1 | bat --paging=never --plain -l=help
}
