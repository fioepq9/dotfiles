#!/usr/bin/env bash

rsync -a src/ ~/.local/share/chezmoi
chezmoi apply

