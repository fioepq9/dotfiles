.PHONY: run
run:
	docker run -it --rm dotfiles

.PHONY: build
build:
	docker build -t dotfiles .