#!/usr/bin/env bash
set -euo pipefail

NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

if [[ -d "$NVM_DIR/.git" ]]; then
    echo "nvm already installed"
    exit 0
fi

if [[ -e "$NVM_DIR" ]]; then
    echo "$NVM_DIR already exists; leaving it unchanged"
    exit 0
fi

echo "Installing nvm"
NVM_VERSION="$(curl -fsSL https://api.github.com/repos/nvm-sh/nvm/releases/latest | awk -F'"' '/"tag_name":/ { print $4; exit }')"

if [[ -z "$NVM_VERSION" ]]; then
    echo "Could not determine latest nvm version" >&2
    exit 1
fi

git clone --depth=1 --branch "$NVM_VERSION" https://github.com/nvm-sh/nvm.git "$NVM_DIR"
