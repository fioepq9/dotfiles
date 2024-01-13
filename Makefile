.PHONY: run
run:
	podman run -it --rm dotfiles

.PHONY: build
build:
	podman build -t dotfiles .