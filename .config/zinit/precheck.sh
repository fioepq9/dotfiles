has() {
	command -v "$@" >/dev/null 2>&1 && return 0 || return 1
}