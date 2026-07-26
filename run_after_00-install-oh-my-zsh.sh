#!/usr/bin/env bash
set -euo pipefail

OMZ_DIR="$HOME/.oh-my-zsh"

if [[ -d "$OMZ_DIR/.git" ]]; then
    echo "Oh My Zsh already installed"
    exit 0
fi

if [[ -e "$OMZ_DIR" ]]; then
    echo "$OMZ_DIR already exists; leaving it unchanged"
    exit 0
fi

echo "Installing Oh My Zsh"
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$OMZ_DIR"
